# Checkpoint 4: Graph Analytics

We implemented our graph analytics modeling questions using GraphFrames and Apache Spark. We pulled our data from the CPDB Postgres server and performed post-processing using Python in a Jupyter Notebook environment.


## Prerequisites

The following lists the prerequistites required to run our code using Python. Note that all the requirements under **Python Modules** can be installed using `pip`.

* Jupyter Notebook
  * `pip install jupyter`
* Java 11 (JDK)
  * `brew install openjdk@11`
  * Need to keep track of path to JDK
* Apache Spark
  * Need to keep track of path to Spark
* Python3 > 3.8
* Python Modules
  * `pandas`
  * `psycopg2`
  * `networkx`
  * `matplotlib`
  * `pyspark`
  * `findspark`
  * `graphframes`



## Description of Files and How to Run

Most of our checkpoint 4 code is in the `submission.ipynb` Jupyter notebook. See instructions below on how to run the notebook.


### Jupyter Notebooks

All Jupyter notebooks can be run using the following command

```jupyter notebook [filename].ipynb```


### `db.py` Utility File

Utilities for accessing and retreving data from the Postgres database server. This file is not run manually but needs to be included in Jupyter Notebook files.


### SQL Files

Note that most SQL files won't be run directly. Instead, they will be queried through our Python wrapper in our Jupyter notebooks.

However, all SQL files can be run using

```psql -U cpdb cpdb < [filename].sql```

`edges.sql`

SQL query for retrieving the TRR edges for our graph analytics.

`timestamp_edges.sql`

SQL query for retrieving the baseline edges for our graph analytics.

`nodes.sql`

SQL query for retrieving the nodes for our graph analytics.

`analysis2.sql`

SQL code for running off shift analysis.


### CSV Files

These data files serve as support for our data analysis. There is no need to run them but we include them in the submission for completeness.

