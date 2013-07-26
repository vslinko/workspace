remote_file "#{Chef::Config[:file_cache_path]}/Caffeine.zip" do
  source node[:my_computer][:caffeine][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/Caffeine.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/Caffeine.app")
  end
end
