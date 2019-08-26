#!/bin/bash

function in {
  for dir in config/* config/.*    # list directories in the form "/tmp/dirname/"
  do
    dir=${dir%*/}      # remove the trailing "/"
    dir=${dir##*/}     # keep everything after config
    cmd="cp -rf ~/$dir ./config/"
    if [ $dir != ".." ] && [ $dir != "." ]; then
      echo "running: $cmd"    # print everything after the final "/"
      eval $cmd
    fi
  done
}

function out {
  for dir in config/* config/.*    # list directories in the form "/tmp/dirname/"
  do
    dir=${dir%*/}      # remove the trailing "/"
    dir=${dir##*/}     # keep everything after config
    cmd="cp -rf ./config/$dir ~"
    if [ $dir != ".." ] && [ $dir != "." ]; then
      echo "running: $cmd"    # print everything after the final "/"
      eval $cmd
    fi
  done
}

$@