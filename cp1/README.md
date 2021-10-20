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

## Information About Victims and Officers

**1a. What is the difference between the subject race distribution and its distribution in the total population?**

SQL File: `1a.sql`

Command: `psql cpdb cpdb < src/1a.sql`


**1b. What portion of these use of force cases involves an officer that is of a different race than that of the victim (cross-race use of force) and what are the racial distributions of the subjects and officers in these cases?**

SQL File: `1b.sql`

Command: `psql cpdb cpdb < src/1b.sql`


**1c. What portion of use of force cases in tactical response reports involved police officer firearm usage?**

SQL File: `1c.sql`

Command: `psql cpdb cpdb < src/1c.sql`



## Environmental Factors That May Affect an Officer’s Decision to Use Force

**2a. What portion of the use of force happened under different lighting conditions?**

SQL File: `2a.sql`

Command: `psql cpdb cpdb < src/2a.sql`


**2b. What portion of the use of force happened under different weather conditions?**

SQL File: `2b.sql`

Command: `psql cpdb cpdb < src/2b.sql`


**2c. Under what combinations of different conditions (lighting, indoor or outdoor, weather, location) is a police officer more likely to use force?**

SQL File: `2c.sql`

Command: `psql cpdb cpdb < src/2c.sql`


**2d. How does the influence of the top 10 combinations of different conditions vary from race to race?**

SQL File: `2d.sql`

Command: `psql cpdb cpdb < src/2d.sql`
