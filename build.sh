#!/bin/bash

SOURCEDIR="source"
BUILDDIR="docs"

sphinx-build -a -E -j auto -b html ${SOURCEDIR} ${BUILDDIR}
