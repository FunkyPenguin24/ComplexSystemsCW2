val df = sqlContext.sql("SELECT category, AVG(rating) FROM reviews GROUP BY category ORDER BY category")

df.show()

System.exit(0)
