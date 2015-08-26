all:
	for texfile in *.tex; do \
		pdflatex $${texfile} && \
		pdflatex $${texfile} && \
		latex2html $${texfile}; \
	done; \

git:
	git add Makefile; \
	git add *.tex; \
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

deepclean: clean
	for directory in $$(ls -d */); do \
		rm -r $${directory}; \
	done; \
