function gitall() {  
    VAR=$(git add --all)
    echo "$VAR"
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
};
gitall
