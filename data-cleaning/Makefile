clean:
	rm -rf output/*

dist: src/cleaning.py src/database.py src/integration.py src/run.py src/utils.py src/README output/
	$(MAKE) clean && zip -r the-freedom-deer.zip $^
