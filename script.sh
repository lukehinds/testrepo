#!/bin/bash

echo -e "Running bugsbunny script"

read -p "Are you sure you want to continue? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    echo -e "Doing some stuff...."
    sleep 2
else
  exit 0
fi
