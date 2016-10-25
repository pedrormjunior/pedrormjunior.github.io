all: index.html

makelatex = \
	for i in $$(seq 3); do \
		htlatex $(1) "xhtml, mathml, charset=utf-8" " -cunihtf -utf8"; \
	done; \

index.html: index.tex
	$(call makelatex,$<)
