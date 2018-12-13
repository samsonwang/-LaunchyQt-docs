# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = build
GH_PAGES_SOURCES = source Makefile

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)


deploy:
	git checkout gh-pages
	git pull
	rm -rf $(BUILDDIR) $(SOURCEDIR)
	git checkout master $(GH_PAGES_SOURCES)
	git reset HEAD
	make html
	(cd $(BUILDDIR)/html && tar c ./) | (cd ./ && tar xf -)
	rm -rf $(GH_PAGES_SOURCES) $(BUILDDIR) .buildinfo
	git add -A
	git commit -m "Generated gh-pages for `git log master -1 --pretty=short --abbrev-commit`" && git push origin gh-pages ; git checkout master
	@echo
	@echo "Deployment finished."
