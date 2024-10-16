# Netflix Data Analysis Project

![Netflix logo](https://github.com/vidita30/Netflix_SQL_Project/blob/main/n%20logo.jpg)

# Overview
This project entails an in-depth analysis of Netflix's movies and TV shows data using SQL. The objective is to uncover actionable insights and address key business questions based on the dataset. This README outlines the project's goals, business challenges, solutions, key findings, and conclusions drawn from the analysis.

# Objectives
1.Analyze the distribution of content types (movies vs TV shows): 
- Examine the balance between the number of movies and TV shows available on Netflix.
  
2.Identify the most common ratings for movies and TV shows:
- Analyze the distribution of content ratings and identify the most frequent ratings for both movies and TV shows.</br>

3.List and analyze content based on release years, countries, and durations:</br>
- Explore content trends by analyzing release years, identifying which countries produce the most content, and categorizing    content based on its duration.</br>

4.Content Addition Patterns:</br>
- Explore patterns in content availability based on date_added to Netflix.</br>
- Identify seasonal or regional trends in content addition.</br>

5.Rating Distribution:</br>
- Analyze the most common ratings assigned to both movies and TV shows.</br>
- Examine the correlation between ratings and other factors like genre, region, or director.</br>

6.Text-Based Insights:</br>
- Perform text analysis on the description column to identify common keywords or themes.</br>
- Categorize content based on the sentiment or tone of its description.</br>

# Dataset
The dataset used has been added in the folder itself.

# Schema
*Created the table in SQL using command prompt* 
```sql
create table netflix
    -> (
    -> show_id varchar(6),
    -> type varchar(10),
    -> title varchar(150),
    -> director varchar(208),
    -> casts varchar(1000),
    -> country varchar(150),
    -> date_added varchar(50),
    -> release_year int,
    -> rating varchar(10),
    -> duration varchar(15),
    -> listed_in varchar(55),
    -> description varchar(250)
    -> );
```
*Imported the contents of the csv file using the following query*
```sql
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Netflix_data.csv'
    -> into table netflix
    -> fields terminated by ','
    -> enclosed by '"'
    -> lines terminated by '\n'
    -> ignore 1 rows
    -> (show_id,type,title,director,casts,country,date_added,release_year,rating,duration,listed_in,description);
```

