WITH adoptable AS (
	SELECT
		status,
		breed
		
	FROM
		pets
	
	WHERE
		status = 'ADOPTABLE' AND type = 'Dog'
		
	ORDER BY breed
)

SELECT
	breed,
	COUNT(breed) AS count

FROM adoptable

GROUP BY breed

ORDER BY count DESC