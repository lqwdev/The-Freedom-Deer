# Checkpoint 4: Graph Analytics

We implemented our graph analytics modeling questions using GraphFrames and Apache Spark. We pulled our data from the CPDB Postgres server and performed post-processing using Python in a Jupyter Notebook environment.

Since this include many prerequisites, we put everything inside a Google colab notebook so it could be run with a single click.

# Steps to Run Graphframe in Colab

1. Open the Google colab link: https://colab.research.google.com/drive/1HjkrUA3oWY5qV8tcZtO9p68RevA3JxDU?usp=sharing.

2. Click on `Runtime -> Run all`.

3. Wait ...

# Steps to Run Downstream Analysis with SQL

1. Download the table 'triangles.csv' saved in Colab from above

2. Change the file path (in the COPY block) in analysis2.sql into your local path where the table is downloaded

3. Run each block to get separate analysis results
