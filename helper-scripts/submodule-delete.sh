#!/usr/bin/env sh

plugin=$1
vim_home="$HOME/.vim"
plugin_dir="$vim_home/pack/plugins/start"
module_dir="$vim_home/.git/modules/pack/plugins/start"

git submodule deinit -f "$plugin_dir/$plugin"
git rm -f "$plugin_dir/$plugin"
rm -Rf "${module_dir:?}/$plugin"
