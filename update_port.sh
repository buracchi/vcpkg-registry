#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

REPOSITORY=$1
COMMIT=$2
PORT_NAME="libcommon"
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
sed -i 's/\("git-tree": \).*/\1'"\"$GIT_TREE\""'/g' ./versions/l-/$PORT_NAME.json
git diff -w | git apply --cached --ignore-whitespace
git commit --amend --no-edit
