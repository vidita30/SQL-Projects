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
# Queries 
1.Compare the total number of Movies versus TV Shows on Netflix.
```sql
select type,
    -> count(*)
    -> from netflix
    -> group by type;
```

2.Identify the most frequent rating for both Movies and TV Shows.
```sql
select type,MAX(rating)
    -> from netflix
    -> group by 1;
```
3.Retrieve a list of all movies released in a particular year (e.g., 2020).
```sql
select * from netflix
    -> where type='Movie' and release_year=2020;
```
4.Count Content Added Each Year
```sql
SELECT
    ->     EXTRACT(YEAR FROM STR_TO_DATE(date_added, '%M %d, %Y')) AS year,
    ->     COUNT(*) AS total_added
    -> FROM netflix
    -> GROUP BY year
    -> ORDER BY year;
```
5.Rank the top 5 countries that have the highest amount of content on Netflix.
```sql
select country,count(*) as total_content
    -> from netflix
    -> group by country
    -> order by total_content desc
    -> limit 5;
```
6.Determine the longest movie available on Netflix.
```sql
select title,duration
    -> from netflix
    -> where type='Movie'
    -> order by cast(substring_index(duration,'',1)as unsigned) desc
    -> limit 1;
```
7.Find the content added to Netflix in the last 5 years.
```sql
SELECT *
    -> FROM netflix
    -> WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
```
8.Display all the Movies or TV Shows directed by 'Toshiya Shinohara'
```sql
SELECT title, type, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE director = 'Toshiya Shinohara';
```
9.List TV shows that have more than 5 seasons.
```sql
 SELECT title, duration
    -> FROM netflix
    -> WHERE type = 'TV Show'
    -> AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;
```
10.Count the number of content items in each genre.
```sql
select listed_in as genre,count(*) as total_content
    -> from netflix
    -> group by listed_in
    -> order by total_content desc;
```
11.For each year, calculate the average number of content released in India and display the top 5 years with the highest averages.
```sql
select release_year,
    -> count(*) / count(distinct release_year) as avg_content
    -> from netflix
    -> where country like '%India%'
    -> group by release_year
    -> limit 5;
```
12.Retrieve all movies that fall under the category of documentaries.
```sql
SELECT title, director, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE type = 'Movie'
    -> AND listed_in LIKE '%Documentaries%';
```
13.Find content that doesn't have a listed director.
```sql
SELECT title, type, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE director IS NULL OR director = '';
```
14.Identify how many movies actor 'Salman Khan' appeared in over the last 10 years.
```sql
SELECT COUNT(*) AS total_movies
    -> FROM netflix
    -> WHERE type = 'Movie'
    -> AND casts LIKE '%Salman Khan%'
    -> AND release_year >= 2014;
```
15.Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
```sql
SELECT
    ->     CASE
    ->         WHEN LOWER(description) LIKE '%kill%' OR LOWER(description) LIKE '%violence%' THEN 'Violent'
    ->         ELSE 'Non-Violent'
    ->     END AS category,
    ->     COUNT(*) AS content_count
    -> FROM netflix
    -> GROUP BY category;
```
