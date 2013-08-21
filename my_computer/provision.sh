#!/bin/bash

cd $(dirname $0)
berks install --path cookbooks
sudo chef-solo -c solo.rb -o "recipe[vslinko],recipe[my_computer]"
