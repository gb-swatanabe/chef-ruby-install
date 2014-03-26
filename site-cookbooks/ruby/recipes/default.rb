#
# Cookbook Name:: ruby211
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

source_root = node['ruby']['dir']['source']
source_name = node['ruby']['package']
source_file = node['ruby']['package'] + ".tar.bz2"

source_url  = "http://cache.ruby-lang.org/pub/ruby/2.1/" + source_file

prefix = node['ruby']['dir']['prefix']

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
