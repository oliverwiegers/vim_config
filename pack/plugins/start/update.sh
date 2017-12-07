#!/bin/bash

for i in $(ls) ; do
	if [ -d $i ]; then
		printf "\n\e[32m\e[1mChangin directory to: $i\n\e[0m\n"
		cd $i
		[[ "$(git branch | cut -d" " -f2)" != "master" ]] && git checkout master
		git pull
		cd ..
	fi
done
