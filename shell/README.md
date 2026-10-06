# Shell

Setup for files in the `$HOME/.shell` folder.

## Setup

Follows the [setup.sh](./setup.sh) script.

Add shebang to [setup.sh](./setup.sh) and import utils.

```sh
#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

```

Copy [aliases](./aliases.md) file and add it to zshrc.

```sh
copy_file $DIR/aliases.sh .shell/aliases.sh

ZSHRC=$HOME/.zshrc
SOURCE_ALIASES="source ~/.shell/aliases.sh"

if ! grep -q "$SOURCE_ALIASES" $ZSHRC; then
	echo $SOURCE_ALIASES >> $ZSHRC
fi
```
