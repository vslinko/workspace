remote_file "#{Chef::Config[:file_cache_path]}/1Password.zip" do
  source node[:my_computer][:one_password][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/1Password.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/1Password.app")
  end
end
