val df = sqlContext.read.text("/home/cloudera/cw2/req4/finalresult.csv")
val newdf =df.withColumn("_tmp", split($"value", "\t")).select(
	$"_tmp".getItem(0).as("count"),
	$"_tmp".getItem(1).as("phrase")
).drop("_tmp")
val newnewdf = newdf.sort($"count".desc, $"phrase")
newnewdf.show()

System.exit(0)
