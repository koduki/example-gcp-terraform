#!/bin/bash

git checkout main
git pull

git checkout env/prd
git pull
git merge main

git checkout env/prd_review
git pull
git merge env/prd

git checkout env/dev
git pull
git merge env/prd_review
