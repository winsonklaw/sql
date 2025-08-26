WITH lost_dogs AS (
	SELECT
		COALESCE(city, 'Unknown') as cities,
		type
		
	FROM pets
	
	WHERE type = 'Dog' 
),

lost_cities AS (

	SELECT 
		INITCAP(cities) as city_all,
		type
	
	FROM lost_dogs
),

rank AS (
	SELECT 
		city_all,
		COUNT(*) AS count
		
	FROM lost_cities
	
	WHERE city_all != 'Unknown'
		
	GROUP BY city_all, type
	
	ORDER BY count DESC
)

SELECT
	city_all,
	DENSE_RANK () OVER (
		ORDER BY count DESC) AS dense_rank,
	count
		
FROM rank