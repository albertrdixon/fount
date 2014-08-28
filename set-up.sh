#!/bin/sh
# SCRIPT_DIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))
SCRIPTDIR=$(cd $(dirname "$0") && pwd)

echo "==> Setting up dot files"
DOTFILES=(bash_profile bashrc alias gitconfig)
for file in ${DOTFILES[@]};
do
  cp -vf "$SCRIPT_DIR/$file" ~/.$file
done

echo "==> Done, enjoy!"
exit 0
