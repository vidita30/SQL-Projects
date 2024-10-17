1.Compare the total number of Movies versus TV Shows on Netflix.

select type,
    -> count(*)
    -> from netflix
    -> group by type;
2.Identify the most frequent rating for both Movies and TV Shows.

select type,MAX(rating)
    -> from netflix
    -> group by 1;
3.Retrieve a list of all movies released in a particular year (e.g., 2020).

select * from netflix
    -> where type='Movie' and release_year=2020;
4.Count Content Added Each Year

SELECT
    ->     EXTRACT(YEAR FROM STR_TO_DATE(date_added, '%M %d, %Y')) AS year,
    ->     COUNT(*) AS total_added
    -> FROM netflix
    -> GROUP BY year
    -> ORDER BY year;
5.Rank the top 5 countries that have the highest amount of content on Netflix.

select country,count(*) as total_content
    -> from netflix
    -> group by country
    -> order by total_content desc
    -> limit 5;
6.Determine the longest movie available on Netflix.

select title,duration
    -> from netflix
    -> where type='Movie'
    -> order by cast(substring_index(duration,'',1)as unsigned) desc
    -> limit 1;
7.Find the content added to Netflix in the last 5 years.

SELECT *
    -> FROM netflix
    -> WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
8.Display all the Movies or TV Shows directed by 'Toshiya Shinohara'

SELECT title, type, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE director = 'Toshiya Shinohara';
9.List TV shows that have more than 5 seasons.

 SELECT title, duration
    -> FROM netflix
    -> WHERE type = 'TV Show'
    -> AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;
10.Count the number of content items in each genre.

select listed_in as genre,count(*) as total_content
    -> from netflix
    -> group by listed_in
    -> order by total_content desc;
11.For each year, calculate the average number of content released in India and display the top 5 years with the highest averages.

select release_year,
    -> count(*) / count(distinct release_year) as avg_content
    -> from netflix
    -> where country like '%India%'
    -> group by release_year
    -> limit 5;
12.Retrieve all movies that fall under the category of documentaries.

SELECT title, director, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE type = 'Movie'
    -> AND listed_in LIKE '%Documentaries%';
13.Find content that doesn't have a listed director.

SELECT title, type, release_year, country, rating, duration
    -> FROM netflix
    -> WHERE director IS NULL OR director = '';
14.Identify how many movies actor 'Salman Khan' appeared in over the last 10 years.

SELECT COUNT(*) AS total_movies
    -> FROM netflix
    -> WHERE type = 'Movie'
    -> AND casts LIKE '%Salman Khan%'
    -> AND release_year >= 2014;
15.Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords

SELECT
    ->     CASE
    ->         WHEN LOWER(description) LIKE '%kill%' OR LOWER(description) LIKE '%violence%' THEN 'Violent'
    ->         ELSE 'Non-Violent'
    ->     END AS category,
    ->     COUNT(*) AS content_count
    -> FROM netflix
    -> GROUP BY category;
