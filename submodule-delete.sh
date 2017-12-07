#!/bin/bash

plugin=$1
vimhome="$HOME/.vim"
plugindir="$vimhome/pack/plugins/start"
moduledir="$vimhome/.git/modules/pack/plugins/start"

git submodule deinit $plugindir/$plugin
git rm $plugindir/$plugin
rm -Rf $moduledir/$plugin
