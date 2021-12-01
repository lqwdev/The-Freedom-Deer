FILES = \
	README.md \
	findings.pdf

findings.pdf: findings.tex
	pdflatex $^

dist: $(FILES)
	zip checkpoint-5.zip $^
