val df = sqlContext.sql("SELECT COUNT(reviews.*) AS reviewcount, places.placeid AS placeid, places.placename FROM places INNER JOIN reviews ON places.placeid = reviews.placeid GROUP BY places.placeid, places.placename ORDER BY reviewcount DESC")

df.show(1)

System.exit(0)
