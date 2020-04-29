val df = sqlContext.sql("SELECT pricerange AS pricerange, COUNT(*) AS placecount FROM places GROUP BY pricerange")

df.show()

df.filter(df("pricerange") === "$" || df("pricerange") === "$$" || df("pricerange") === "$$$").show()

System.exit(0)
