-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT film_title, 
	release_year, 
	worldwide_gross
FROM specs
LEFT JOIN revenue 
ON specs.movie_id = revenue.movie_id
ORDER BY worldwide_gross ASC
LIMIT 1;

--Answer: Semi-Tough

-- 2. What year has the highest average imdb rating?

SELECT release_year, 
	AVG(rating.imdb_rating) AS avg_imdb_rating
FROM specs
LEFT JOIN rating
ON specs.movie_id = rating.movie_id
GROUP by release_year
ORDER BY avg_imdb_rating DESC;

--Answer: 1991

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT film_title, mpaa_rating, worldwide_gross
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC;

--Answer: Toy Story 4 

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT DISTINCT company_name, COUNT (film_title)
FROM specs
FULL JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
GROUP BY distributors.company_name;

-- 5. Write a query that returns the five distributors with the highest average movie budget.

SELECT company_name, AVG(film_budget)
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
GROUP BY company_name
ORDER BY AVG(film_budget) DESC
LIMIT 5;


-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

SELECT 
FROM

--Answer:

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

SELECT 
FROM

--Answer:

SELECT *
FROM distributors;

SELECT *
FROM rating;

SELECT *
FROM revenue;

SELECT *
FROM specs;
