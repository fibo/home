#
# Clone or update Git repository.
#
# GIT_BASE_URL is the repository https URL without https:// and repo name
#
git_repo() {
	GIT_BASE_URL=$1
	REPO_NAME=$2

	if test -d $REPO_NAME; then
		cd $REPO_NAME
		git pull --quiet
		cd - 1> /dev/null
	else
		git clone https://$GIT_BASE_URL/${REPO_NAME}.git
	fi
}
