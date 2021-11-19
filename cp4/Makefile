FILES = \
	src/db.py \
	src/submission.ipynb \
	src/analysis2.sql \
	src/edges.sql \
	src/nodes.sql\
	src/timestamp_edges.sql \
	src/pagerank.csv \
	src/pagerank_cross_race.csv \
	src/triangles.csv \
	README.md \
	findings.pdf

findings.pdf: findings.tex
	pdflatex $^

dist: $(FILES)
	zip checkpoint-4.zip $^
