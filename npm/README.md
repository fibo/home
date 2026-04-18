# npm config

Add shebang to [setup.sh](./setup.sh).

	#!/bin/sh
	

To mitigate security issues, avoid running scripts automatically when dependencies are installed.

	npm config set ignore-scripts true

