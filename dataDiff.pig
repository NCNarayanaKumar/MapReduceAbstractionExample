REGISTER hdfs:///user/cloudera/pigassignment/libs/datafu-1.1.0-cdh5.8.0.jar;
define MD5 datafu.pig.hash.MD5();
A = LOAD 'hdfs:///user/cloudera/pigassignment/data/data1' USING PigStorage(',') AS(id:chararray, att1:chararray, att2:chararray, att3:chararray);
A_MD5 = FOREACH A GENERATE id, MD5((chararray)CONCAT(att1,'|',att2,'|',att3)) as MD5A;
B = LOAD 'hdfs:///user/cloudera/pigassignment/data/data2' USING PigStorage(',') AS(id:chararray, att1:chararray, att2:chararray, att3:chararray);
B_MD5 	= FOREACH B GENERATE id, MD5((chararray)CONCAT(att1,'|',att2,'|',att3)) as MD5B;
outer_left = JOIN B_MD5 BY id LEFT OUTER, A_MD5 BY id;
results = FILTER outer_left BY (MD5A != MD5B or MD5A is null);
DUMP results;
