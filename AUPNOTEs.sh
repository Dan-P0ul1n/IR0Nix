#!/bin/bash

id=$(id | cut -d'=' -f2 | cut -d'(' -f1)
ROOT
USER

if [ $id = 0 ] ; then
  $ROOT
elif [ $id = !0 ] ; then
  $USER
fi

