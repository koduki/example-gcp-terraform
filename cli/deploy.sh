#!/bin/bash

APP_DIR=$(cd $(dirname $0);pwd)
CMD="git commit -m '$1' -a && git push && sleep 5 && $APP_DIR/tail_buildlog.sh"

echo '$ '$CMD
echo ""

echo "Waiting 5 sec..."

git add projects
echo $CMD|sh
