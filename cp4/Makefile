FILES = \
	src/triangles.csv \
	src/analysis2.sql \
	README.md \
	findings.pdf

findings.pdf: findings.tex
	pdflatex $^

dist: $(FILES)
	zip checkpoint-4.zip $^
