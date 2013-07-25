#!/bin/bash

_installing_() {
  echo -e "\033[1m##### Installing $1...\033[0m"
}

_installed_() {
  echo
}

_homebrew_() {
  _installing_ "homebrew"

  if [ ! -d /usr/local/Cellar ]; then
    curl -L https://raw.github.com/mxcl/homebrew/go | ruby
  fi

  _installed_ "homebrew"
}

_rvm_() {
  _installing_ "rvm"

  if [ ! -d $HOME/.rvm ]; then
    curl -L https://get.rvm.io | bash -s stable --ruby=1.9
    source $HOME/.rvm/scripts/rvm
  fi

  _installed_ "rvm"
}

_dmg_pkg_() {
  name=$1
  result_dir=$2
  url=$3

  _installing_ $name

  if [ ! -d $result_dir ]; then
    dmg=$name.dmg
    dir=/Volumes/$name
    pkg=$dir/$name.pkg

    curl -Lo $dmg $url
    hdiutil attach -mountpoint $dir $dmg
    sudo installer -pkg "$pkg" -target /
    hdiutil detach "$dir"
    rm $dmg
  fi

  _installed_ $name
}

_gem_() {
  name=$1

  _installing_ $name

  gem list | grep $name > /dev/null
  if [ $? != 0 ]; then
    gem install $name
  fi

  _installed_ $name
}

_vagrant_plugin_() {
  name=$1

  _installing_ $name

  vagrant plugin list | grep $name > /dev/null
  if [ $? != 0 ]; then
    vagrant plugin install $name
  fi

  _installed_ $name
}

_brew_() {
  name=$1

  _installing_ $name

  brew list | grep $name > /dev/null
  if [ $? != 0 ]; then
    brew install $name
  fi

  _installed_ $name
}

_workspace_() {
  _installing_ "workspace"

  if [ ! -d $HOME/workspace ]; then
    git clone https://github.com/vslinko/workspace.git $HOME/workspace
  fi

  _installed_ "workspace"
}

_my_computer_() {
  _installing_ "my_computer"

  $HOME/workspace/projects/my_computer/provision.sh

  _installed_ "my_computer"
}

if [ ! -f $HOME/workspace/projects/my_computer/Berksfile.lock ]; then
  _homebrew_

  _rvm_

  _dmg_pkg_ VirtualBox \
    /Applications/VirtualBox.app \
    http://download.virtualbox.org/virtualbox/4.2.16/VirtualBox-4.2.16-86992-OSX.dmg

  _dmg_pkg_ Vagrant \
    /Applications/Vagrant \
    http://files.vagrantup.com/packages/0219bb87725aac28a97c0e924c310cc97831fd9d/Vagrant-1.2.4.dmg

  _gem_ chef
  _gem_ berkshelf

  _vagrant_plugin_ vagrant-berkshelf

  _brew_ git
  _brew_ vim
  _brew_ zsh

  _workspace_
fi

_my_computer_
