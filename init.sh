INITIAL_WORKING_DIR=`pwd`
cd
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
function clone_repo () {
    REPO_URL=$1
    REPO_NAME=$(basename $REPO_URL | cut -d . -f1)
    [ -e $REPO_NAME ] || git clone $REPO_URL
}
cd ~/.bash
clone_repo https://github.com/jimeh/git-aware-prompt.git
cd ~/.shell
clone_repo https://github.com/fibo/dir.git
clone_repo https://github.com/fibo/cleanup_git_branches.git
clone_repo https://github.com/fibo/gh-clone.git
cd $INITIAL_WORKING_DIR
echo home sweet home
rm -rf .git .gitignore
unset BACKUP_DAY
unset BACKUP_DIR
unset INITIAL_WORKING_DIR
unset -f backup_if_any
unset -f clone_repo
