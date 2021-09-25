.PHONY: clean unzip help

help:
	@echo "Choose a recipe from below:\n \
	- unzip\n \
	- clean"

unzip: clean
	mkdir data
	unzip raw-data -d data
	rm -rf data/__MACOSX
	find . -name "*.gz" | xargs gunzip

clean:
	rm -rf data/
