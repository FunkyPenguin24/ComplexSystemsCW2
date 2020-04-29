val df = sqlContext.sql("SELECT placeid, userid, reviewtext FROM reviews")
val numrows = df.count()
df.repartition(numrows.toInt).rdd.saveAsTextFile("/home/cloudera/cw2/req8/reviewstxt/")
System.exit(0)
