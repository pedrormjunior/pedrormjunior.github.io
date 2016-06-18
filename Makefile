all:
	for texfile in *.tex; do \
		htlatex $${texfile} "xhtml, mathml, charset=utf-8" " -cunihtf -utf8" && \
		htlatex $${texfile} "xhtml, mathml, charset=utf-8" " -cunihtf -utf8"&& \
		htlatex $${texfile} "xhtml, mathml, charset=utf-8" " -cunihtf -utf8"; \
	done; \

mvpedrormjunior:
	if [ -d pedrormjunior ]; then \
		mv pedrormjunior/*.html .; \
		mv pedrormjunior/*.pl .; \
		mv pedrormjunior/*.css .; \
		rm -r pedrormjunior/; \
	fi; \
