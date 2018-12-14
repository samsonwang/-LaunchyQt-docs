#!/bin/bash

SOURCEDIR="source"
BUILDDIR="docs"

sphinx-build -b html ${SOURCEDIR} ${BUILDDIR}
