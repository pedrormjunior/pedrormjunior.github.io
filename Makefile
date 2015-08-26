all:
	for texfile in *.tex; do \
		pdflatex $${texfile} && \
		bibtex $$(basename $${texfile} .tex) && \
		pdflatex $${texfile} && \
		pdflatex $${texfile} && \
		latex2html -no_navigation -split 0 $${texfile}; \
	done; \
	make mvpedrormjunior; \

mvpedrormjunior:
	if [ -d pedrormjunior ]; then \
		mv pedrormjunior/*.html .; \
		mv pedrormjunior/*.pl .; \
		mv pedrormjunior/*.css .; \
		rm -r pedrormjunior/; \
	fi; \

git:
	git add Makefile; \
	git add *.tex; \
	git add *.bib; \
	git add *.html; \
	git add *.pl; \
	git add *.css; \
	for directory in $$(ls -d */); do \
		git add $${directory}*.html; \
		git add $${directory}*.pl; \
		git add $${directory}*.css; \
	done; \
        git commit -m "$$(uname -s -n) $$(date)"; \
        git push; \

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
