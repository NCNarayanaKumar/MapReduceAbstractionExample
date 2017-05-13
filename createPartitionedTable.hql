set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=1000;

CREATE TABLE IF NOT EXISTS training.wettestpopulation(
msa STRING,
population STRING,
totalrainfall double,
wettestpopulation double
)
PARTITIONED BY (year STRING,month STRING)
STORED AS PARQUET;

--load data from external table into hive managed table
INSERT OVERWRITE TABLE training.wettestpopulation PARTITION (year, month)
SELECT msa,
population,
totalrainfall,
wettestpopulation,
year,
month
FROM wettestpopulation_ext;

