DROP TABLE IF EXISTS exampledb.example_ext;

CREATE EXTERNAL TABLE IF NOT EXISTS exampledb.example_ext(
msa STRING,
population STRING,
year STRING,
month STRING,
totalrainfall double,
wettestpopulation double)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
location '/user/cloudera/exampledir';
