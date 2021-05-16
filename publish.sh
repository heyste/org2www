#!/bin/bash

# set -x
set -e

echo "Kill 'org2www' container"
docker rm -f org2www

mkdir -p /tmp/org2www/{drafts,publish}
cp -R static /tmp/org2www/publish

export SITE_PORT="1234"
export SITE_URL="http://$(hostname -f):${SITE_PORT}/"
export SITE_POSTS=$HOME/org/roam
export SITE_DRAFTS=/tmp/org2www/drafts
export SITE_PUBLISH=/tmp/org2www/publish
export SITE_TITLE="Org 2 WWW"
export SITE_AUTHOR="Site Author"

echo "Export org to html"
current_dir=$(pwd -P)
emacs --batch --no-init-file \
      --load ${current_dir}/lisp/htmlize.el \
      --load ${current_dir}/lisp/org-static-blog.el \
      --load ${current_dir}/lisp/site-config.el \
      --funcall org-static-blog-publish

echo "Restart 'org2www' container"
docker run -d --name org2www \
           -p 0.0.0.0:${SITE_PORT}:80 \
           --mount type=bind,source=/tmp/org2www/publish,destination=/usr/local/apache2/htdocs/ \
           httpd:2.4

