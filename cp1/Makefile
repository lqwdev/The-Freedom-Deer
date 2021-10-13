findings.pdf: findings.tex
	pdflatex $^ && rm -rf *.aux *.log

dist: src/ README.md findings.pdf
	zip checkpoint-1.zip $^
