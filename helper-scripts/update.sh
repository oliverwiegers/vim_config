#!/bin/bash

plugindir="$HOME/.vim/pack/plugins/start"

for i in $(ls $plugindir) ; do
	plugin="$plugindir/$i"
	if [ -d $plugin ]; then
		printf "\n\e[32m\e[1mChangin directory to: $plugin\n\e[0m\n"
		cd $plugin
		[[ "$(git branch | cut -d" " -f2)" != "master" ]] && git checkout master
		git pull
	fi
done
