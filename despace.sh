#!/usr/bin/env bash
# 
#  despace: Swap spaces for underscores in filenames of specified directory
#  Created by Aaron Wolen on 2013-06-03
#
# usage: despace directory 

# Check directory
dir=$1
if [[ -z "$dir" || ! -d "$dir" ]]; then
  echo "You must specify a directory."
  exit 1
fi

# Replace IFS
SYSIFS=$IFS
IFS=$(echo -ne "\n\b")

# Identify offending files
files=($(find $dir -type f -name "*\ *"))
IFS=$SYSIFS

echo "Found ${#files[@]} filename(s) with spaces."

# Rename
if [[ ${#files[@]} > 0 ]]; then
  echo "Renaming:"
  for f in "${files[@]}"; do
    to=${f// /_}
    echo "  $f to $to"
    mv "$f" $to
  done
fi

