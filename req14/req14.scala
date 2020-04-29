val df = sqlContext.sql("SELECT rating AS rating, AVG(length(reviewtext)) AS avgCharLength FROM reviews GROUP BY rating")

df.show()

System.exit(0)
