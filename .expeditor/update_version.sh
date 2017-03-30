#!/bin/bash
set -evx

export LANG=en_US.UTF-8

. ci/bundle_install.sh

bundle exec rake version:update

git checkout .bundle/config
