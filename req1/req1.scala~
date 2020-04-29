val df = sqlContext.spark.time(sql("SELECT COUNT(*) AS count FROM reviews where rating = 1 UNION ALL SELECT COUNT(*) AS count FROM reviews where rating = 2 UNION ALL SELECT COUNT(*) AS count FROM reviews where rating = 3 UNION ALL SELECT COUNT(*) AS count FROM reviews where rating = 4 UNION ALL SELECT COUNT(*) AS count FROM reviews where rating = 5").show)

df.withColumn("count", 'count.cast("string"))
res0.write.mode("overwrite").text("/home/cloudera/cw2/req1/result")

System.exit(0)

