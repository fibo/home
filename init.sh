cd
rm -rf .git .gitignore .gitmodules
BACKUP_DAY=$(date +%F)
BACKUP_DIR=$HOME/.home_backup/$BACKUP_DAY
mkdir -p $BACKUP_DIR
function backup_if_any () {
    TARGET=$(echo $1 | tr / _ | sed 's/^\./_/')
    [ -e $1 ] && mv -v $1 $BACKUP_DIR/$TARGET;
}
curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
    | grep ! | cut -d ! -f2 \
        | while read x; do backup_if_any $x; done
git init -b main
git remote add my https://github.com/fibo/home.git
git fetch
git switch home
git submodule update --init
git submodule foreach git config core.fileMode false
rm -rf .git .gitignore .gitmodules
unset BACKUP_DAY
unset BACKUP_DIR
cd -
echo home sweet home
