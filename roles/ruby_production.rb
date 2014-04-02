name "ruby_production"
run_list "recipe[ruby]"
default_attributes("ruby" => {
                     "version" => "2.1.1",
                     "download_site" => "http://cache.ruby-lang.org/pub/ruby/",
                     "dir" => {
                       "source" => "/usr/local/src",
                       "destination" => "/opt",
                     }
                   }
                   )
