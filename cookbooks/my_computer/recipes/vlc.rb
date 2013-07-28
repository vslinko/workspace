dmg_package "VLC" do
  source node[:my_computer][:vlc][:url]
  volumes_dir "vlc-2.0.7"
end
