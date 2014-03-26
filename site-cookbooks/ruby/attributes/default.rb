# Ruby 2.1.1 Install

default["ruby"]["package"] = "ruby-" + node["ruby"]["version"]

default["ruby"]["dir"]["source"] = "/usr/local/src"
default["ruby"]["dir"]["prefix"] = "/opt/" + default["ruby"]["package"]
