hdfs dfs -put GoogleLocal/places.csv /home/cloudera/cw2/ #places the GoogleLocal datasets into the HDFS
hdfs dfs -put GoogleLocal/reviews.csv /home/cloudera/cw2/
hdfs dfs -put GoogleLocal/users.csv /home/cloudera/cw2/
spark-shell -i /home/cloudera/cw2/sqlSetup #sets up the database and loads the datasets into it
spark-shell USE GoogleLocal

req1()
{
	if [ ! -d "/home/cloudera/cw2/req1/result/" ]
	then
		echo "Calculating ratings..."
		spark-shell -i /home/cloudera/cw2/req1/req1.scala
		hdfs dfs -get /home/cloudera/cw2/req1/result/ /home/cloudera/cw2/req1/
	fi
	read -p 'Enter rating: ' reqRating
	cd /home/cloudera/cw2/req1/result/
	filenum="$(($reqRating-1))"
	fileprefix="part-r-0000${filenum}"
	filename=$(find . -iname "${fileprefix}*")
	req1value=$(</home/cloudera/cw2/req1/result/$filename)
	echo Number of reviews with a rating of $reqRating is $req1value
}

req2()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req2/req2.scala/
}

req3()
{
	echo "Creating dataset..."
	spark-shell -i /home/cloudera/cw2/req3/req3.scala/
}

req4()
{
	echo "Calculating..."
	if [ ! -d "/home/cloudera/cw2/req4/result/result" ]
	then
		spark-shell -i /home/cloudera/cw2/req4/req4.scala
		hdfs dfs /home/cloudera/cw2/req4/result/ /home/cloudera/cw2/req4/result/
	fi
	read -p 'Enter rating: ' reqRating
	ratingfolder="rat${reqRating}"
	cd /home/cloudera/cw2/req4/result/result/$ratingfolder
	reviewfilepath=$(find . -iname "part*")
	fp="/home/cloudera/cw2/req4/result/result/$ratingfolder${reviewfilepath//.}"
	echo $fp
	java -jar /home/cloudera/cw2/req4/req4.jar $fp
	hdfs dfs -put -f /home/cloudera/cw2/req4/finalresult.csv /home/cloudera/cw2/req4/
	spark-shell -i /home/cloudera/cw2/req4/req42.scala
}

req5()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req5/req5.scala/
}

req6()
{
	spark-shell -i /home/cloudera/cw2/req6/req6.scala/
}

req7()
{
	if [ ! -d "/home/cloudera/cw2/req7/result/" ]
	then
		echo "Calculating..."
		spark-shell -i /home/cloudera/cw2/req7/req7.scala/		
		hdfs dfs -get /home/cloudera/cw2/req7/result/ /home/cloudera/cw2/req7/
	fi
	cd /home/cloudera/cw2/req7/result/
	truefilename=$(find . -iname "part-r-00000*")
	falsefilename=$(find . -iname "part-r-00001*")
	trueValue=$(</home/cloudera/cw2/req7/result/$truefilename)
	falseValue=$(</home/cloudera/cw2/req7/result/$falsefilename)
	echo "Number of places that are closed is $trueValue"
	echo "Number of places that are NOT closed is $falseValue"
}

req8()
{
	read -p 'Enter word: ' reqWord
	grep -i -w "$reqWord" /home/cloudera/cw2/req8/results2/part-r-00000
}

req9()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req9/req9.scala
}

req10()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req10/req10.scala
}

req11()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req11/req11.scala/
}

req12()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req12/req12.scala/
}

req13()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req13/req13.scala/
}

req14()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req14/req14.scala/
}

req15()
{
	echo "Calculating..."
	spark-shell -i /home/cloudera/cw2/req15/req15.scala/
}

while :
do
	cd /home/cloudera/cw2
	echo "===================== MAIN MENU ======================="
	echo 1. Compute the number of reviews that have a certain rating
	echo 2. Compute the number of places for each price range
	echo 3. Create a subset of IT Specialist user
	echo NW4. Compute the 20 most frequent phrases used in reviews of a specific rating MAPREDUCE REVIEWS
	echo 5. Retrieve all places that have more than 3 reviews
	echo 6. Retrieve all the reviews written by an IT Specialist
	echo 7. Compute the number of places that are permanently closed
	echo 8. List all documents associated with a specific word 
	echo 9. Compute the average rating for each category
	echo 10. Retrieve the top 5 categories in the reviews that have the highest average rating
	echo 11. Retrieve the number of places that are still operating in each price range
	echo 12. Compute the average rating for each price range
	echo 13. Compute the number of reviews for each price range
	echo 14. Compute the average length of reviews for each rating
	echo 15. Retrieve the place that has received the largest number of reviews
	echo 16. Exit
	echo =================== NW: NOT WORKING ==================
	read -p 'Enter selection: ' choice

	case $choice in
		1)
			req1;;
		2)
			req2;;
		3)
			req3;;
		4)
			req4;;
		5)
			req5;;
		6)
			req6;;
		7)
			req7;;
		8)
			req8;;
		9)
			req9;;
		10)
			req10;;
		11)
			req11;;
		12)
			req12;;
		13)
			req13;;
		14)
			req14;;
		15)
			req15;;
		16)
			echo "Exiting..."
			break
			;;
	esac

done
