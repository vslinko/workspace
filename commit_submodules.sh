#!/bin/bash

cd $(dirname $0)
submodules=$(grep 'path =' .gitmodules | awk '{print $3}')
for submodule in $submodules; do
  git add $submodule
done
git commit $submodules -m "chore: submodules update"
