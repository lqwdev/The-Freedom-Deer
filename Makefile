.PHONY: clean unzip help

help:
	@echo "Choose a recipe from below:\n \
	- unzip\n \
	- clean"

unzip: clean
	mkdir data
	unzip raw-data -d data
	rm -rf data/__MACOSX

clean:
	rm -rf data/
