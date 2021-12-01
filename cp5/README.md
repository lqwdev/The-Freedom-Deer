# Introduction

In this checkpoint, we extended one of our previous exploratory findings which showed considerably more cross-race cases in use of force, meaning that the police officer and subject involved are from different race groups, than same-race cases. Here, we are interested in investigating the role race plays in police misconduct.


# Steps to Run Analysis

Our analysis is split into three parts, data joining, sentiment analysis, and regression analysis. Instructions to run each step is listed below.


## Data Joining

We would like to first join and filter the data using SQL. The script we use is `cp5_select_regression_table.sql`. To run

```
psql -U cpdb cpdb < cp5_select_regression_table.sql
```

We then output the joined data into a csv file `cp5_regress_table.csv`.


## Sentiment Analysis

First we need to generate sentiment analysis scores for our existing data using a pretrained BERT NLP model. This is done in the Jupyter notebook `sentiment-analysis.ipynb`.

To start the notebook, run:

```
jupyter notebook sentiment-analysis.ipynb
```

Then within the notebook, run all the cells. The notebook will automatically save the results in a local csv file `cp5_data_with_sa_score.csv`.


## Regression Analysis

Our regression analysis is done in `regression.ipynb`.

To start the notebook, run:

```
jupyter notebook sentiment-analysis.ipynb
```

Then run all the cells within the notebook to see the analysis.
