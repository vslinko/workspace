remote_file "#{Chef::Config[:file_cache_path]}/HackPad.zip" do
  source node[:my_computer][:hackpad][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/HackPad.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/HackPad.app")
  end
end
