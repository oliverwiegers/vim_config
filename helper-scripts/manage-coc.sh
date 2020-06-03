#!/usr/bin/env sh

# A POSIX variable.
# Reset in case getopts has been used previously in the shell.
OPTIND=1

# Initialize variables.
vim_home="$HOME/.vim"
plugin_dir="${vim_home}/pack/plugins/start"
current_dir="$PWD"

# Print usage.
print_usage() {
    usage="$(basename "$0") [-h] -- Script to manage coc.nvim installation.

        -h  show this usage.
        -i  install coc.nvim
        -d  delete coc.nvim
        -u  update coc.nvim"

    printf '%s\n' "${usage}"
}

install_coc() {
    cd "${plugin_dir}" || exit 1
    curl -L --progress-bar \
        https://github.com/neoclide/coc.nvim/archive/release.tar.gz \
        | tar xzf -
    mv coc.nvim* coc.nvim
    cd "${current_dir}" || exit 1
}


delete_coc() {
    cd "${plugin_dir}" || exit 1
    rm -rf coc.nvim
    cd "${current_dir}" || exit 1
}

update_coc() {
    delete_coc
    install_coc
}

# Parse command line arguments.
while getopts "hiud" opt; do
    case "$opt" in
    h)
        print_usage
        exit 0
        ;;
    i)
        install_coc
        exit 0
        ;;
    d)
        delete_coc
        exit 0
        ;;
    u)
        update_coc
        exit 0
        ;;
    *)
        print_usage
        exit 1
        ;;
    esac

done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift
