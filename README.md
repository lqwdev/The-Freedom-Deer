# MSAI 339 Data Science Project

**Team: The Freedom Deer**


## How to use this repository

### Cloning

To clone the repository, run the following command

```bash
git clone https://github.com/lqwdev/ai339-project.git
```

### Data

To extract top level raw data, run

```bash
make unzip
```

After running the above command, the unzipped data will be found in the directiory `data/fully-unified-data`. All the `.gz` files will be unzipped (Note that this depends on `gunzip`).

To see all files, run

```bash
tree data/
```

To remove the unzipped data directory, run

```bash
make clean
```
