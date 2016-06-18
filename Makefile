all:
	for texfile in *.tex; do \
		htlatex $${texfile} "xhtml,mathml,charset=utf-8" && \
		htlatex $${texfile} "xhtml,mathml,charset=utf-8"&& \
		htlatex $${texfile} "xhtml,mathml,charset=utf-8"; \
	done; \

mvpedrormjunior:
	if [ -d pedrormjunior ]; then \
		mv pedrormjunior/*.html .; \
		mv pedrormjunior/*.pl .; \
		mv pedrormjunior/*.css .; \
		rm -r pedrormjunior/; \
	fi; \

clean:
	find . -name "*~" -delete
	find . -name "*.dvi" -delete
	find . -name "*.pdf" -delete
	find . -name "*.log" -delete
	find . -name "*.aux" -delete
	find . -name "*.bbl" -delete
	find . -name "*.blg" -delete

deepclean: clean
	for directory in $$(ls -d */); do \
		rm -r $${directory}; \
	done; \
