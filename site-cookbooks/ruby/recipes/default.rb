#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

source_root = node['ruby']['dir']['source']
source_name = node['ruby']['package']
source_file = node['ruby']['package'] + ".tar.bz2"

VERSION = node['ruby']['version']
MAJOR, MINOR = VERSION.split(/\./)[0,2]

source_url  = sprintf("http://cache.ruby-lang.org/pub/ruby/%s.%s/%s",
                      MAJOR,
                      MINOR,
                      source_file
                      )

prefix = sprintf( "%s/ruby-%s",
                  node['ruby']['dir']['destination'],
                  VERSION,
                  )

depend_pkgs = %w{build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev}

depend_pkgs.each{|pkg|
  package pkg do
    action :install
  end
}

bash "download ruby" do
  not_if "test -f #{source_root}/#{source_file}"

  code <<-EOH
    wget #{source_url} -P #{source_root}
  EOH
end

bash "install ruby" do
  not_if "test -x #{prefix}/bin/ruby"

  cwd source_root
  code <<-EOH
    rm -rf #{source_name}
    tar xjf #{source_file}

    cd #{source_name}
    ./configure --prefix=#{prefix}
    make
    make install
  EOH
end

gem_package 'bundler' do
  gem_binary "#{prefix}/bin/gem"
  action :install
end
