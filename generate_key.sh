#!/bin/bash

cd $(dirname $0)

if [ ! -f cookbooks/project_workspace/files/default/id_rsa ]; then
  ssh-keygen -C "project_workspace" -f cookbooks/project_workspace/files/default/id_rsa -P "" -q

  key=$(cat cookbooks/project_workspace/files/default/id_rsa.pub)

  http --auth vyacheslav.slinko@gmail.com post https://api.github.com/user/keys title=project_workspace key="$key"
fi
