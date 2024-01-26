#!/usr/bin/bash

# MoveLatexOutput v1.0
# by Hans Dürr
# hans@hansduerr.de
# Licensed under GPLv3

usage()
{
  echo "Usage: `basename $0` [-p latex_file] [-f]  <folder>"
  exit -1
}

if [ -d .git ]; then            # check if git Repository exists
    branchname=$(git branch --show-current)
else
    echo "No git repository! Exiting..."
    exit
fi

echo $branchname

if [ ! -d $branchname ]; then    # check if directory with $branchname already exists
    mkdir $branchname
fi

if compgen -G "./*.pdf" > /dev/null; then # check if pdf files exist in directory, https://stackoverflow.com/questions/6363441/check-if-a-file-exists-with-a-wildcard-in-a-shell-script
    cp *.pdf $branchname/
    echo "pdf files succesfully copied"
fi

path=${!#}
echo $path

exit

# Require folder name
if [ -z $path ] || [ ! -d $path ]; then
  usage
  exit 1
fi


  # default values
  thefile=${path%%/}/*
  name=false
  docheck=true

  while getopts ":fp:" opt; do
    case $opt in
      f)
        echo "Removing latex junk without security check..." >&2
        docheck=false
        ;;
      p)
        echo "Removing junk-files for $OPTARG" >&2
        thefile=${path%%/}/${OPTARG%\.tex}
        name=true
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        usage
        exit 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument." >&2
        usage
        exit 1
        ;;
    esac
  done

# Ensure the argument is a .tex file and exists.
if [ $name == true ] && [ ! -f $thefile.tex ]; then
  echo "Can't find ${thefile}.tex"
  usage
fi

if [ $docheck == true ]; then
  echo "CAUTION: This script will delete files with certain extensions without further prompt. If you confirm, please enter [Y] (upper-case y): "
  read confirm
  if [ "$confirm" != "Y" ]; then
    echo "-- aborted ---"
    exit 1
  fi
fi

  # Remove leftovers from latex
  rm -f $thefile.aux $thefile.log $thefile.out
  # Remove leftovers from bibtex
  rm -f $thefile.bbl $thefile.blg $thefile.bcf
  # Remove leftovers from glossaries
  rm -f $thefile.glg $thefile.gls $thefile.glo
  # Remove leftovers from lists
  rm -f $thefile.lof $thefile.lot $thefile.toc
  # Remove leftovers from minitoc
  rm -f $thefile.mtc* $thefile.maf
  # Remove other stuff
  rm -f $thefile.run.xml
  rm -f $thefile.acn $thefile.acr $thefile.alg
  rm -f $thefile.ist $thefile.synctex* $thefile.alg

  echo "Latex junk files successfully removed."
  exit 0
