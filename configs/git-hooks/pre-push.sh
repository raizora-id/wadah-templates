#!/bin/bash

# Prevent direct push to main branch
protected_branch="main"
current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ $protected_branch = $current_branch ]
then
    echo "⛔ Pushing to $protected_branch branch is not allowed."
    echo "🔀 Please create a separate branch and use a pull request."
    exit 1
fi

# Check if trying to push to main branch on remote
while read local_ref local_sha remote_ref remote_sha
do
    if [ "$remote_ref" == "refs/heads/$protected_branch" ]
    then
        echo "⛔ Pushing to $protected_branch branch on remote is not allowed."
        echo "🔀 Please create a separate branch and use a pull request."
        exit 1
    fi
done

exit 0