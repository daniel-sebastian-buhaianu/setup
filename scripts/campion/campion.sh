#!/bin/bash
if [ -z "$1" ]; then
  echo "Folosire: ./campion.sh [numeProblema]"
else
  numeProblema=$1
  numeRepo="campion-$numeProblema"
  gh repo create $numeRepo -c --public
  if [ -d "./$numeRepo" ]; then
    pathToReadme="$numeRepo/README.md"
    touch $pathToReadme
    echo "# $numeRepo" >> $pathToReadme
    pathToLinkPy="/home/dsb99/sh/campion/link.py"
    linkProblema=$(python3 "$pathToLinkPy" "$numeProblema")
    if [ -z "$linkProblema" ]; then
      echo "Nu am putut obtine linkul problemei"
    else
      echo " " >> $pathToReadme
      echo $linkProblema >> $pathToReadme
    fi
    cd $numeRepo
    git add . && git commit -m "Initial commit"
    git push --set-upstream origin master
  else
    echo "Eroare la gh repo create"
  fi
fi
