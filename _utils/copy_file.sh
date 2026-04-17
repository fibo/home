#
# Copy file if does not exist.
# Warn if file exists and source file differs.
#
# SOURCE is an absolute filepath of a file in this repo
# TARGET is a filepath relative to user $HOME dir
#
copy_file() {
	SOURCE=$1
	TARGET=$2
	COPY=false

	if ! test -e $HOME/$TARGET; then
		echo Create file $TARGET
		COPY=true
	elif ! cmp -s "$SOURCE" "$HOME/$TARGET"; then
		echo Source file differs from target: $TARGET
		BACKUP=$HOME/.local/share/home/$TARGET
		mkdir -p $(dirname $BACKUP)
		cp $HOME/$TARGET $BACKUP
		echo Backup copy to $BACKUP
		COPY=true
	fi

	if test $COPY = "true"; then
		mkdir -p $(dirname $HOME/$TARGET)
		cp $SOURCE $HOME/$TARGET
	fi
}
