val df = sqlContext.sql("SELECT COUNT(*) AS reviewcount, placeid AS placeid FROM reviews GROUP BY placeid ORDER BY reviewcount DESC")

df.filter("reviewcount > 3").show()

System.exit(0)
