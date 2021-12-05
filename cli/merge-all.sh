#!/bin/bash

git checkout main
git pull

git checkout env/all
git pull
git merge main

git checkout env/all_review
git pull
git merge env/all
