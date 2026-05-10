# npm config

Add shebang to [setup.sh](./setup.sh)

	#!/bin/sh

## Recommended settings

To mitigate security issues, avoid running scripts automatically when dependencies are installed.

	npm config set ignore-scripts true

You may need to add `ignore-scripts=true` to _.npmrc_ config file in projects that need to run scripts. For example if you install `electron` package before versions 42, it downloads the Electron binary in a postinstall script.

There is no reason to use CommonJS anymore, unless in some really specific cases. So let's default to ES modules.

	npm config set init-type module

## Additional settings

Other settings it may be worth to add but they are omitted cause too specific. You can run them manually. Notice that you can also create other _.npmrc_ files. For example I have one in my `$HOME/Code/GitHub/` folder with these settings, so those apply only for repositories I clone there. Basically you run the commands, then cut their output from `$HOME/.npmrc` and copy it to another _.npmrc_ file.

You can check the result by moving into a folder and running

```sh
npm config list
```

I use the _MIT License_ by default and usually when I start a module I initilize it with version `0.0.0`.

```sh
npm config set init-license MIT
npm config set init-version 0.0.0
```

In case you want to set author name and URL do something like

```sh
npm config set init-author-name "Gianluca Casati"
npm config set init-author-url https://fibo.github.io
```

