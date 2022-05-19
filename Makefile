SED=$(shell [ "$$(uname -s)" = "Darwin" ] && echo gsed || echo sed)

all: \
	index.html \
	template.html \
	dataset-VLPL.html \
	oscmi.html \
	OSNNet.html \
	GPG_pubkey.html \
	SSVM-results.html \
	OSSVM.html \
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
	MendesJunior2019b.bib.html \
	MendesJunior2022.bib.html \
	SorianoVargas2021.bib.html \
	Werneck2022.bib.html \

makelatex = \
	for i in $$(seq 1); do \
		make4ht $(1) "common"; \
	done; \

%.html: %.tex common.tex footer.tex \
		common.cfg Makefile
	$(call makelatex,$<)

%.bib.html: ${HOME}/dotfiles/bibliography/pedrormjunior.bib \
		source-highlight/* Makefile
	$(eval bibfile = $(basename $@))
	$(eval key = $(basename ${bibfile}))
	@echo Generating $@
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
		--remove eic \
		--remove isoabbrtitle \
		--remove abbrjournal \
		--remove totalcites \
		--remove journalimpactfactor \
		--remove impfactorwithoutselfcites \
		--remove fiveyearimpactfactor \
		--remove immediacyindex \
		--remove totalarticles \
		--remove totalreviews \
		--remove citedhalflife \
		--remove citinghalflife \
		--remove eigenfactorscore \
		--remove articleinfluencescore \
		--remove originalresearch \
		--remove normeigenfactor \
		--remove avgjifpercentile \
		-c '$$key="${key}"' \
			$< > ${bibfile} \
			2> /dev/null
	@${SED} -i "s/@inproceedings/@InProceedings/g" ${bibfile}
	@${SED} -i "s/@article/@Article/g" ${bibfile}
	@${SED} -i "s/@mastersthesis/@MastersThesis/g" ${bibfile}
	@${SED} -i "s/@techreport/@TechReport/g" ${bibfile}
	@${SED} -i "s/@phdthesis/@PhdThesis/g" ${bibfile}
	@${SED} -i "s/á/{\\\\'a}/g" ${bibfile}
	@${SED} -i "s/é/{\\\\'e}/g" ${bibfile}
	@${SED} -i "s/í/{\\\\'i}/g" ${bibfile}
	@${SED} -i "s/ó/{\\\\'o}/g" ${bibfile}
	@${SED} -i "s/ú/{\\\\'u}/g" ${bibfile}
	@${SED} -i "s/ã/{\\\\~a}/g" ${bibfile}
	@${SED} -i "s/ç/{\\\\c{c}}/g" ${bibfile}
	@source-highlight \
		--quiet \
		--lang-def=source-highlight/bibtex.lang \
		--style-css-file=source-highlight/bibtex.css \
		--css=source-highlight/style.css \
		-i ${bibfile} \
		-o $@
	@${SED} -i '12i<link href="https://fonts.googleapis.com/css?family=Averia Serif Libre" rel="stylesheet"/>' $@

clear:
	rm -f *.4ct *.4tc *.aux *.dvi *.idv *.lg *.log *.tmp *.xref
