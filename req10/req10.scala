val df = sqlContext.sql("SELECT category AS category, AVG(rating) AS rating FROM reviews GROUP BY category ORDER BY rating DESC")

df.show(5)

System.exit(0)
