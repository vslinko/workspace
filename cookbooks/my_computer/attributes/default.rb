default[:my_computer][:user] = "vyacheslav"
default[:my_computer][:group] = "staff"
default[:my_computer][:home] = "/Users/vyacheslav"

default[:my_computer][:alfred][:url] = "http://cachefly.alfredapp.com/Alfred_2.0.6_203.zip"

default[:my_computer][:caffeine][:url] = "http://download.lightheadsw.com/download.php?software=caffeine"

default[:my_computer][:cleanmymac][:url] = "http://dl.devmate.com/com.macpaw.CleanMyMac2/CleanMyMac2.dmg"

default[:my_computer][:dropbox][:url] = "https://www.dropbox.com/download?plat=mac"

default[:my_computer][:flux][:url] = "https://justgetflux.com/mac/Flux.zip"

default[:my_computer][:hackpad][:url] = "https://hackpad.com/static/app/HackPad-0.6.1.zip"

default[:my_computer][:one_password][:url] = "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.21.zip"

default[:my_computer][:skitch][:url] = "http://cdn1.evernote.com/skitch/mac/release/Skitch-2.6.2.zip"

default[:my_computer][:skype][:url] = "http://www.skype.com/go/getskype-macosx.dmg"

default[:my_computer][:sublime_text][:url] = "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg"
default[:my_computer][:sublime_text][:packages] = {
  "AdvancedNewFile" => "https://github.com/skuroda/Sublime-AdvancedNewFile.git",
  "CoffeeScript" => "https://github.com/Xavura/CoffeeScript-Sublime-Plugin.git",
  "Emmet" => "https://github.com/sergeche/emmet-sublime.git",
  #"Git" => "https://github.com/kemayo/sublime-text-2-git.git",
  "Jade" => "https://github.com/davidrios/jade-tmbundle.git",
  #"Markdown Preview" => "https://github.com/revolunet/sublimetext-markdown-preview.git",
  #"Package Control" => "https://github.com/wbond/sublime_package_control.git",
  "Stylus" => "https://github.com/billymoon/Stylus.git",
  "Theme - Soda" => "https://github.com/buymeasoda/soda-theme.git"
}
