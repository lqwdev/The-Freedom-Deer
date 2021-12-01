FILES = \
	src/regression.ipynb \
	src/sentiment-analysis.ipynb \
	src/cp5_select_regression_table.sql \
	src/cp5_regress_table.csv \
	src/cp5_data_with_sa_score.csv \
	README.md \
	findings.pdf

findings.pdf: findings.tex
	pdflatex $^

dist: $(FILES)
	zip checkpoint-5.zip $^
