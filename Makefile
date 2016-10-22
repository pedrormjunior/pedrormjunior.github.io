all:
	for texfile in *.tex; do \
		for i in $$(seq 3); do \
			htlatex $${texfile} "xhtml, mathml, charset=utf-8" " -cunihtf -utf8"; \
		done; \
	done; \
