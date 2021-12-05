#!/bin/bash

MY_ENV=$1
git checkout main
git pull
git branch -D env/${MY_ENV}
git branch -D env/${MY_ENV}_review
git push --delete origin env/${MY_ENV}
git push --delete origin env/${MY_ENV}_review
git checkout -b env/${MY_ENV}
git push --set-upstream origin env/${MY_ENV}
git checkout -b env/${MY_ENV}_review
git push --set-upstream origin env/${MY_ENV}_review
