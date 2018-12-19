#!/bin/sh

# The script will clone and configure git repositories for all Treadmill
# projects.
#
# It is assumed that they are already forked from make Morgan-Stanley repo.

GITHUB_USER=$1
if [ -z $GITHUB_USER ]; then
    echo Usage: $0 YOUR-GITHUB-USERID
    exit 1
fi

mkdir -p git && cd git
for REPO in \
        https://github.com/$GITHUB_USER/treadmill.git        \
        https://github.com/$GITHUB_USER/treadmill-aws.git    \
        https://github.com/$GITHUB_USER/treadmill-deploy.git \
        https://github.com/$GITHUB_USER/treadmill-pid1.git   \
        https://github.com/$GITHUB_USER/treadmill-tktfwd.git \
        https://github.com/$GITHUB_USER/zookeeper-authorizers.git; do \
    git clone $REPO;
done

for LOCALREPO in $(ls); do
    cd $LOCALREPO
        git remote add upstream \
            https://github.com/Morgan-Stanley/$LOCALREPO.git
    cd -
done
