all: \
	index.html \
	template.html \
	dataset-VLPL.html \

makelatex = \
	for i in $$(seq 1); do \
		htlatex $(1) "css, mathml, charset=utf-8" " -cunihtf -utf8"; \
	done; \

%.html: %.tex common.tex css.tex footer.tex \
		css.cfg Makefile
	$(call makelatex,$<)
