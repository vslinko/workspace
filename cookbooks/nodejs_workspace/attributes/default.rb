default[:nodejs_workspace][:global_modules] = [
  "coffee-script",
  "grunt-cli",
  "forever"
]

default[:nodejs_workspace][:project][:name] = "nodejs_project"
default[:nodejs_workspace][:project][:git] = nil
default[:nodejs_workspace][:project][:install_modules] = false
default[:nodejs_workspace][:project][:daemon_command] = nil
