val df = sqlContext.sql("SELECT reviews.userid, reviews.reviewtext, users.jobs FROM reviews INNER JOIN users ON reviews.userid = users.userid WHERE users.jobs = 'IT Specialist'")
df.show()

System.exit(0)
