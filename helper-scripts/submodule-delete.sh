#!/bin/bash

plugin=$1
vimhome="$HOME/.vim"
plugindir="$vimhome/pack/plugins/start"
moduledir="$vimhome/.git/modules/pack/plugins/start"

git submodule deinit -f $plugindir/$plugin
git rm -f $plugindir/$plugin
rm -Rf $moduledir/$plugin
