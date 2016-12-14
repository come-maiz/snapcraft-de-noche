#!/bin/sh
#
# Build a snap using a docker container.
#
# Arguments:
#   repo:        The URL of the repository to build.
#   repo-branch: (optional) The branch of the repository to build. If it is not
#                passed, the default branch will be built.
#   PPA:         (optional) A PPA with build requirements for the snap.

set -ev

repo="$1"
repo_branch="$2"
ppa="$3"

docker run -v "$(pwd)":/cwd ubuntu:xenial sh -c "apt update && apt install locales -y && locale-gen en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && cd /cwd && ./snap.sh $repo $repo_branch $ppa"
