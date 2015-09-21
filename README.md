# HivePerformanceDemo
-------------------------------
This is a Hive performance demo
--
Each hsql file runs the same SQL statement multiple times using various Hive options such as MR, TEZ, Vectorization and CBO.  
--------------------------------

1) Edit the create_demo.sh script and add values for the hadoop user account and home direcotry.

2) Run the create_demo.sh as root, or as another user with hadoop cli priveleges

3) If all Hive objects are created successfuly, run each hsql using the Hive commmand line. For example:

  hive -f fasterReads.hsql
  hive -f fasterAnalytics.hsql
  hive -f fasterJoins.hsql

Each hsql file will output the name of a test, a result set and an execution time. The execution times should be faster with each subsequent test.

 


