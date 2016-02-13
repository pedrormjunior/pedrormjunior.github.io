all:
	for texfile in *.tex; do \
		htlatex $${texfile} && \
		htlatex $${texfile} && \
		htlatex $${texfile}; \
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
