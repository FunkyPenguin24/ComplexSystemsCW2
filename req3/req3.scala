val df = sqlContext.sql("SELECT * FROM users WHERE jobs = 'IT Specialist'")

df.write.mode("overwrite").save("/home/cloudera/cw2/req3/result/")
df.show()

System.exit(0)
