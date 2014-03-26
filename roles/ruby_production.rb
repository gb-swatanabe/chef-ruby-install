name "ruby_production"
run_list "recipe[ruby]"
default_attributes("ruby" => {
                     "version" => "2.1.1"
                   }
                   )
