#!/bin/bash

declare -A REPO_PORT_MAP
REPO_PORT_MAP["argparser"]="argparser"
REPO_PORT_MAP["common"]="libcommon"
REPO_PORT_MAP["cutest"]="cutest"

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

REPOSITORY=$1
COMMIT=$2

if [ -z "${REPO_PORT_MAP[$REPOSITORY]}" ]; then
    echo "Unknown repository: $REPOSITORY"
    exit 1
fi

PORT_NAME="${REPO_PORT_MAP[$REPOSITORY]}"
PORT_NAME_VERSION_FOLDER=$(echo "$PORT_NAME" | cut -c1 | tr '[:upper:]' '[:lower:]')-

mkdir -p ./tmp
SHA512=$(
    cd ./tmp;
    wget https://github.com/buracchi/$REPOSITORY/archive/$COMMIT.tar.gz;
    echo $(sha512sum $COMMIT.tar.gz | cut -d " " -f1);
)
rm -r "./tmp"
sed -i 's/\(\sREF \).*/\1'"$COMMIT"'/g' ./ports/$PORT_NAME/portfile.cmake
sed -i 's/\(\SHA512 \).*/\1'"$SHA512"'/g' ./ports/$PORT_NAME/portfile.cmake
git diff -w | git apply --cached --ignore-whitespace
git commit -m "Update"
GIT_TREE=$(git rev-parse HEAD:ports/$PORT_NAME)
sed -i 's/\("git-tree": \).*/\1'"\"$GIT_TREE\""'/g' ./versions/$PORT_NAME_VERSION_FOLDER/$PORT_NAME.json
git diff -w | git apply --cached --ignore-whitespace
git commit --amend --no-edit
