# GitHub

Add shebang to [setup.sh](./setup.sh) and import utils

	#!/bin/sh
	
	DIR=$(dirname $0)
	source $DIR/../_utils/copy_file.sh
	

Usually I clone GitHub repos in `$HOME/Code/GitHub/` folder where I place this [gitconfig](./gitconfig)

	copy_file $DIR/gitconfig Code/GitHub/.gitconfig

In my _$HOME/.gitconfig_ I need to reference it with

```
[includeIf "gitdir:~/Code/GitHub/"]
  path = ~/Code/GitHub/.gitconfig
```

Add the config if it does not exist.

	GITCONFIG=$HOME/.gitconfig
	GITHUB_CONFIG=$(grep 'Code/GitHub' $GITCONFIG | tr -d '\n' | tr -d '[:space:]')
	if [ "$GITHUB_CONFIG" != '[includeIf"gitdir:~/Code/GitHub/"]path=~/Code/GitHub/.gitconfig' ]; then
		echo '[includeIf "gitdir:~/Code/GitHub/"]' >> $GITCONFIG
		echo '  path = ~/Code/GitHub/.gitconfig' >> $GITCONFIG
	fi


