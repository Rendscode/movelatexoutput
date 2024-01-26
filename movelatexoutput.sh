#!/usr/bin/bash

# MoveLatexOutput v1.0
# by Hans Dürr
# hans@hansduerr.de
# Licensed under GPLv3

usage()
{
  echo "Usage: `basename $0` <inputfolder>"
  exit -1
}

if [ -d .git ]; then            # check if git Repository exists
    branchname=$(git branch --show-current)
else
    echo "No git repository! Can't copy files! Exiting..."
    exit 1
fi

# echo $branchname


path=${!#}
# echo $path


# Require folder name
if [ -z $path ] || [ ! -d $path ]; then
  usage
  exit 1
fi


if [ ! -d $path/$branchname ]; then    # check if directory with $branchname already exists
    mkdir $path/$branchname
fi

if compgen -G "$path/*.pdf" > /dev/null; then # check if pdf files exist in directory, https://stackoverflow.com/questions/6363441/check-if-a-file-exists-with-a-wildcard-in-a-shell-script
    for f in $path/*.pdf; do
        cp "$f" $path/$branchname/
    done   
    echo "pdf files succesfully copied to $path/$branchname/"
    exit 0
else
    echo "No pdf files found!"
    exit 1
fi


