val df = sqlContext.sql("SELECT reviewtext FROM reviews WHERE rating = 1")
df.write.mode("overwrite").text("/home/cloudera/cw2/req4/result/rat1")

val df = sqlContext.sql("SELECT reviewtext FROM reviews WHERE rating = 2")
df.write.mode("overwrite").text("/home/cloudera/cw2/req4/result/rat2")

val df = sqlContext.sql("SELECT reviewtext FROM reviews WHERE rating = 3")
df.write.mode("overwrite").text("/home/cloudera/cw2/req4/result/rat3")

val df = sqlContext.sql("SELECT reviewtext FROM reviews WHERE rating = 4")
df.write.mode("overwrite").text("/home/cloudera/cw2/req4/result/rat4")

val df = sqlContext.sql("SELECT reviewtext FROM reviews WHERE rating = 5")
df.write.mode("overwrite").text("/home/cloudera/cw2/req4/result/rat5")

System.exit(0);
