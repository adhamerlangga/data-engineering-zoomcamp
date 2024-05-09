-- Question 1: Create External Table

create or replace external table taxi_data.external_table_green_taxi_data
options (
  format = 'PARQUET',
  URIS=['gs://green_taxi_homework_module_3/*']
)

-- Question 2:
create or replace table taxi_data.green_taxi_data 
as (
  select *
  from `imposing-vista-416522.taxi_data.external_table_green_taxi_data`
)

create or replace table `taxi_data.green_taxi_partitioned_table`
partition by date(lpep_pickup_datetime)
cluster by pulocationid as (
  select * from `imposing-vista-416522.taxi_data.green_taxi_data`
)

-- Question 4: Partition and Cluster
create or replace table `taxi_data.green_taxi_partitioned_table`
partition by date(lpep_pickup_datetime)
cluster by pulocationid as (
  select * from `imposing-vista-416522.taxi_data.green_taxi_data`
)

-- Question 5 - Performance Compare Partitioned vs Materialized Table
-- 12.82 MB
select distinct(PULocationID)
from `imposing-vista-416522.taxi_data.green_taxi_data`
where lpep_pickup_datetime between '2022-06-01' and '2022-06-30';

-- 1.12 MB
select distinct(PULocationID)
from `imposing-vista-416522.taxi_data.green_taxi_partitioned_table`
where lpep_pickup_datetime between '2022-06-01' and '2022-06-30';

-- Question 6: Where is the data stored in the External Table you created?
-- GCP Bucket

-- Question 7: It is best practice in Big Query to always cluster your data:
-- False
-- Because when the data is <1GB, it's tend to slow down our query

-- Question 8: Write a SELECT count(*) query FROM the materialized table you created. How many bytes does it estimate will be read? Why?
-- 0 bytes
-- Bigquery materialized table (the table where  data is stored in bigquery) has the metadata about the row counts. Hence no need to get all the rows and count it.