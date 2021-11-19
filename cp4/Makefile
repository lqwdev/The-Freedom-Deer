FILES = \
	src/db.py \
	src/submission.ipynb \
	src/analysis1.sql \
	src/analysis2.sql \
	src/edges.sql \
	src/nodes.sql\
	src/timestamp_edges.sql \
	src/pagerank.csv \
	src/pagerank_cross_race.csv \
	src/triangles.csv \
	src/count_shift.csv \
	src/officer2110_influence.csv \
	src/top_influence.csv \
	README.md \
	findings.pdf

findings.pdf: findings.tex
	pdflatex $^

dist: $(FILES)
	zip checkpoint-4.zip $^
