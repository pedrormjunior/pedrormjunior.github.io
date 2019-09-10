
all: \
	index.html \
	template.html \
	dataset-VLPL.html \
	oscmi.html \
	OSNNet.html \
	\
	MendesJunior2011.bib.html \
	MendesJunior2012.bib.html \
	MendesJunior2014b.bib.html \
	MendesJunior2018b.bib.html \
	Penatti2015.bib.html \
	Pazinato2016.bib.html \
	Neira2018.bib.html \
	Werneck2018.bib.html \
	MendesJunior2017.bib.html \
	MendesJunior2019.bib.html \
	MendesJunior2010.bib.html \
	MendesJunior2019a.bib.html \
	MendesJunior2019b.bib.html \

makelatex = \
	for i in $$(seq 1); do \
		htlatex $(1) "common, mathml, charset=utf-8" " -cunihtf -utf8"; \
	done; \

%.html: %.tex common.tex footer.tex \
		common.cfg Makefile
	$(call makelatex,$<)

%.bib.html: ${HOME}/Bitbucket/bibliography/pedrormjunior.bib \
		source-highlight/* Makefile
	$(eval bibfile = $(basename $@))
	$(eval key = $(basename ${bibfile}))
	@bib2bib \
		-q \
		--no-comment \
		--warn-error \
		--expand \
		--expand-xrefs \
		--remove if \
		--remove qualis \
		--remove abstract \
		--remove keywords \
		--remove citedby \
		--remove timestamp \
		--remove cites \
		--remove file \
		--remove link1 \
		--remove link2 \
		--remove link3 \
		--remove link4 \
		--remove link5 \
		--remove link6 \
		--remove link7 \
		--remove link8 \
		--remove link9 \
		-c '$$key="${key}"' \
			$< > ${bibfile}
	@sed -i "s/@inproceedings/@InProceedings/g" ${bibfile}
	@sed -i "s/@article/@Article/g" ${bibfile}
	@sed -i "s/@mastersthesis/@MastersThesis/g" ${bibfile}
	@sed -i "s/@techreport/@TechReport/g" ${bibfile}
	@sed -i "s/@phdthesis/@PhdThesis/g" ${bibfile}
	@sed -i "s/á/{\\\\'a}/g" ${bibfile}
	@sed -i "s/é/{\\\\'e}/g" ${bibfile}
	@sed -i "s/í/{\\\\'i}/g" ${bibfile}
	@sed -i "s/ó/{\\\\'o}/g" ${bibfile}
	@sed -i "s/ú/{\\\\'u}/g" ${bibfile}
	@sed -i "s/ã/{\\\\~a}/g" ${bibfile}
	@sed -i "s/ç/{\\\\c{c}}/g" ${bibfile}
	@source-highlight \
		--quiet \
		--lang-def=source-highlight/bibtex.lang \
		--style-css-file=source-highlight/bibtex.css \
		--css=source-highlight/style.css \
		-i ${bibfile} \
		-o $@
	@sed -i '12i<link href="https://fonts.googleapis.com/css?family=Averia Serif Libre" rel="stylesheet"/>' $@
