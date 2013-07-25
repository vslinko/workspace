dmg_package "Sublime Text" do
  source node[:my_computer][:sublime_text][:url]
end

packages_dir = "#{node[:my_computer][:home]}/Library/Application Support/Sublime Text 3/Packages"

directory packages_dir do
  recursive true
  owner node[:my_computer][:user]
  group node[:my_computer][:group]
end

node[:my_computer][:sublime_text][:packages].each do |name, repository|
  git "#{packages_dir}/#{name}" do
    repository repository
    user node[:my_computer][:user]
    group node[:my_computer][:group]
  end
end

cookbook_file "#{packages_dir}/User/Preferences.sublime-settings" do
  owner node[:my_computer][:user]
  group node[:my_computer][:group]
end
