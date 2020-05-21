CREATE DATABASE GoogleLocal;
USE GoogleLocal;

CREATE TABLE reviews (
placeid CHAR(21),
userid CHAR(21),
rating CHAR(21),
reviewername VARCHAR(30),
reviewtext STRING,
category varchar(20),
reviewtime VARCHAR(15)
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

CREATE TABLE places (
placeid CHAR(21),
placename VARCHAR(40),
pricerange VARCHAR(3),
address VARCHAR(40),
address VARCHAR(40),
hours STRING,
phone VARCHAR(15),
closed VARCHAR(5)
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

CREATE TABLE users (
userid CHAR(21),
username VARCHAR(40),
jobs VARCHAR(40),
currentplace VARCHAR(30),
previousplace VARCHAR(30),
education STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

load data inpath '/home/cloudera/cw2/reviews.csv/' into table reviews;
load data inpath '/home/cloudera/cw2/places.csv/' into table places;
load data inpath '/home/cloudera/cw2/users.csv/' into table users;

System.exit(0);
