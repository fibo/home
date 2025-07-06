cd
rm -rf .git
BACKUP_DAY=$(date +%F)
BACKUP_DIR=$HOME/.home_backup/$BACKUP_DAY
mkdir -p $BACKUP_DIR
function backup_if_any () {
    TARGET=$(echo $1 | tr / _ | sed 's/^\./_/')
    [ -e $1 ] && mv -v $1 $BACKUP_DIR/$TARGET;
}
backup_if_any .gitignore
curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
    | grep ! | cut -d ! -f2 \
        | while read x; do backup_if_any $x; done
backup_if_any .gitmodules
curl -L https://raw.githubusercontent.com/fibo/home/home/.gitmodules \
    | grep path | cut -d = -f2 \
        | while read x; do backup_if_any $x; done
git init -b main
git remote add my https://github.com/fibo/home.git
git fetch
git switch
git submodule update --init
git submodule foreach git config core.fileMode false
cd -
echo home sweet home
unset BACKUP_DAY
unset BACKUP_DIR
