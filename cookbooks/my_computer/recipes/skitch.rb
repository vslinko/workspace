remote_file "#{Chef::Config[:file_cache_path]}/Skitch.zip" do
  source node[:my_computer][:skitch][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/Skitch.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/Skitch.app")
  end
end
