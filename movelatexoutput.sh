#!/usr/bin/bash

# MoveLatexOutput v1.3
# by Hans Dürr
# hans@hansduerr.de
# Licensed under GPLv3

usage()
{
  echo "Usage: `basename $0` <filename> <outputfolder>"
  exit -1
}

if [ -d .git ]; then            # check if git Repository exists
    branchname=$(git branch --show-current)
else
    echo "No git repository! Can't copy files! Exiting..."
    exit 1
fi

# echo $branchname


outpath=${!#} # ? letzter Übergabeparameter (laut https://devhints.io/bash ist ! ein pointer)
#echo $outpath

# Requires folder name
if [ -z $outpath ] || [ ! -d $outpath ]; then
  usage
  exit 1
fi
# Requires filename of document to move as first argument
files_to_move=$1
if [ -z $files_to_move ]; then
  usage
  exit 1
fi

if [ ! -d $outpath/$branchname ]; then    # check if directory with $branchname already exists
    mkdir $outpath/$branchname
fi

if compgen -G "*.pdf" > /dev/null; then # check if pdf files exist in directory, https://stackoverflow.com/questions/6363441/check-if-a-file-exists-with-a-wildcard-in-a-shell-script
#    cp "$f" $outpath/$branchname/$branchname.pdf
   for f in $files_to_move; do # *.pdf; do
       cp "$f" $outpath/$branchname/$branchname.pdf
   done 
    echo "pdf files succesfully copied to $outpath/$branchname/"
    exit 0
else
    echo "No pdf files found!"
    exit 1
fi


