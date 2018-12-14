#!/bin/bash

SOURCEDIR="source/$1"
BUILDDIR="docs/$1"
LANG=$1

function judge_lang () {
    case $LANG in
        en)
            echo "Building English Vesrion" ;;
        zhCN)
            echo "Building Chinese Version" ;;
        * )
            echo "Invalid Language: $LANG"
            exit ;;
    esac
}

function build() {
    sphinx-build -a -E -j auto -b html ${SOURCEDIR} ${BUILDDIR}
}


if [ $# -gt 0 ]; then
    judge_lang
    build
fi
