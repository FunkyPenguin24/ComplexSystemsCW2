val df = sqlContext.sql("SELECT COUNT(*) FROM places WHERE closed = 'True' UNION ALL SELECT COUNT(*) FROM places WHERE closed = 'False'")

df.withColumn("_c0", '_c0.cast("string"))
res0.write.mode("overwrite").text("/home/cloudera/cw2/req7/result")

System.exit(0)
