# How to run `.sql` source files?

To run `.sql` files on the CPDB database, use the following.

```bash
psql cpdb cpdb < <filename>.sql
```

For example, to run the the code for question 1a, run the following

```bash
psql cpdb cpdb < 1a.sql
```

# Research Questions

In this section, we will list all our research questions that need to be answered by SQL queries and each corresponding SQL source file.


**1a. What is the racial distribution of the victims involved in cases of use of force?**

SQL File: `1a.sql`

Command: `psql cpdb cpdb < src/1a.sql`


**1b. What is the racial distribution of police officers involved in these cases?**

SQL File: `1b.sql`

Command: `psql cpdb cpdb < src/1b.sql`


**1c. What portion of the total use of force cases involves an officer that is of a different race than that of the victim (cross-race use of force)?**

SQL File: `1c.sql`

Command: `psql cpdb cpdb < src/1c.sql`


**1d. What portion of the cases in use of force cases contained firearm usage.**

SQL File: `1d.sql`

Command: `psql cpdb cpdb < src/1d.sql`


**1e. What are the percentages of use of force cases grouped by officer race and subject race? (i.e. what is the percentage of white officers using force on black subjects)**

SQL File: `1e.sql`

Command: `psql cpdb cpdb < src/1e.sql`


**2a. What portion of the use of force happened under different lighting conditions?**

SQL File: `2a.sql`

Command: `psql cpdb cpdb < src/2a.sql`


**2b. What portion of the use of force happened indoors against outdoors?**

SQL File: `2b.sql`

Command: `psql cpdb cpdb < src/2b.sql`


**2c. What portion of the use of force happened under different weather conditions?**

SQL File: `2c.sql`

Command: `psql cpdb cpdb < src/2c.sql`


**2d. What portion of the use of force happened under different locations?**

SQL File: `2d.sql`

Command: `psql cpdb cpdb < src/2d.sql`


**2e. Under what combinations of different conditions (lighting, indoor or outdoor, weather, location) is a police officer more likely to use force?**

SQL File: `2e.sql`

Command: `psql cpdb cpdb < src/2e.sql`


**3. How does the influence of the top 10 combinations of conditions vary from race to race?**

SQL File: `3.sql`

Command: `psql cpdb cpdb < src/3.sql`
