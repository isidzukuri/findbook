#! /bin/bash

dirs=`ls '../apps/' -l | grep ^d | awk '{print $9}'`;

for d in $dirs
do
  if [ "$d" != "newapp" ]; then
    echo "copying to $d"
    cp -f 'schema.rb' "../apps/$d/spec/dummy/db/schema.rb"
  fi
done
