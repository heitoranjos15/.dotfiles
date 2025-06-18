#!/bin/bash
arg=${1:-"team/engagement"}

# Get the current branch
actualBranch=$(git branch --show-current)

trap 'git checkout $actualBranch' EXIT

# Echo the current branch
echo $actualBranch

echo "Updating branch: $arg"

# Checkout the master branch
git checkout master &&

# Delete the old branch locally
git branch -D $arg || echo "Branch $arg does not exist locally, continuing..." &&

git pull &&

# Create a new branch based on master
git checkout $arg &&

# Merge the original branch into the new branch
git merge origin/$actualBranch &&

GIT_EDITOR=true git commit -m "Merge branch $actualBranch"


# Push the new branch to the remote
git push origin $arg &&

# Switch back to the original branch
git checkout $actualBranch
