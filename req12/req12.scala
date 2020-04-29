val df = sqlContext.sql("SELECT places.pricerange AS pricerange, AVG(reviews.rating) AS avgrating FROM places INNER JOIN reviews ON places.placeid = reviews.placeid GROUP BY pricerange")

df.show()

df.filter(df("pricerange") === "$" || df("pricerange") === "$$" || df("pricerange") === "$$$").show()

System.exit(0)
