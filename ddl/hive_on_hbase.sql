-- HiveOnHbase
create database hbase;
CREATE TABLE `hbase.customer`(
  `c_custkey` int,
  `c_name` string,
  `c_address` string,
  `c_city` string,
  `c_nation` string,
  `c_region` string,
  `c_phone` string,
  `c_mktsegment` string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:c_name,cf1:c_address,cf1:c_city,cf1:c_nation,cf1:c_region,cf1:c_phone,cf1:c_mktsegment")
TBLPROPERTIES ("hbase.table.name" = "hive:customer", "hbase.mapred.output.outputtable" = "hive:customer");
CREATE TABLE `hbase.dates`(
  `d_datekey` int,
  `d_date` string,
  `d_dayofweek` string,
  `d_month` string,
  `d_year` int,
  `d_yearmonthnum` int,
  `d_yearmonth` string,
  `d_daynuminweek` int,
  `d_daynuminmonth` int,
  `d_daynuminyear` int,
  `d_monthnuminyear` int,
  `d_weeknuminyear` int,
  `d_sellingseason` string,
  `d_lastdayinweekfl` int,
  `d_lastdayinmonthfl` int,
  `d_holidayfl` int,
  `d_weekdayfl` int)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:d_date,cf1:d_dayofweek,cf1:d_month,cf1:d_year,cf1:d_yearmonthnum,cf1:d_yearmonth,cf1:d_daynuminweek,cf1:d_daynuminmonth,cf1:d_daynuminyear,cf1:d_monthnuminyear,cf1:d_weeknuminyear,cf1:d_sellingseason,cf1:d_lastdayinweekfl,cf1:d_lastdayinmonthfl,cf1:d_holidayfl,cf1:d_weekdayfl")
TBLPROPERTIES ("hbase.table.name" = "hive:dates", "hbase.mapred.output.outputtable" = "hive:dates");
CREATE TABLE `hbase.lineorder`(
  `lo_orderkey` bigint,
  `lo_linenumber` bigint,
  `lo_custkey` int,
  `lo_partkey` int,
  `lo_suppkey` int,
  `lo_orderdate` int,
  `lo_orderpriotity` string,
  `lo_shippriotity` int,
  `lo_quantity` bigint,
  `lo_extendedprice` bigint,
  `lo_ordtotalprice` bigint,
  `lo_discount` bigint,
  `lo_revenue` bigint,
  `lo_supplycost` bigint,
  `lo_tax` bigint,
  `lo_commitdate` int,
  `lo_shipmode` string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:lo_linenumber,cf1:lo_custkey,cf1:lo_partkey,cf1:lo_suppkey,cf1:lo_orderdate,cf1:lo_orderpriotity,cf1:lo_shippriotity,cf1:lo_quantity,cf1:lo_extendedprice,cf1:lo_ordtotalprice,cf1:lo_discount,cf1:lo_revenue,cf1:lo_supplycost,cf1:lo_tax,cf1:lo_commitdate,cf1:lo_shipmode")
TBLPROPERTIES ("hbase.table.name" = "hive:lineorder", "hbase.mapred.output.outputtable" = "hive:lineorder");
CREATE TABLE `hbase.part`(
  `p_partkey` int,
  `p_name` string,
  `p_mfgr` string,
  `p_category` string,
  `p_brand` string,
  `p_color` string,
  `p_type` string,
  `p_size` int,
  `p_container` string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:p_name,cf1:p_mfgr,cf1:p_category,cf1:p_brand,cf1:p_color,cf1:p_type,cf1:p_size,cf1:p_container")
TBLPROPERTIES ("hbase.table.name" = "hive:part", "hbase.mapred.output.outputtable" = "hive:part");
CREATE TABLE `hbase.supplier`(
  `s_suppkey` int,
  `s_name` string,
  `s_address` string,
  `s_city` string,
  `s_nation` string,
  `s_region` string,
  `s_phone` string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:s_name,cf1:s_address,cf1:s_city,cf1:s_nation,cf1:s_region,cf1:s_phone")
TBLPROPERTIES ("hbase.table.name" = "hive:supplier", "hbase.mapred.output.outputtable" = "hive:supplier");
CREATE VIEW `HBASE.p_lineorder` AS SELECT `lineorder`.`lo_orderkey`,
`lineorder`.`lo_linenumber`,
`lineorder`.`lo_custkey`,
`lineorder`.`lo_partkey`,
`lineorder`.`lo_suppkey`,
`lineorder`.`lo_orderdate`,
`lineorder`.`lo_orderpriotity`,
`lineorder`.`lo_shippriotity`,
`lineorder`.`lo_quantity`,
`lineorder`.`lo_extendedprice`,
`lineorder`.`lo_ordtotalprice`,
`lineorder`.`lo_discount`,
`lineorder`.`lo_revenue`,
`lineorder`.`lo_supplycost`,
`lineorder`.`lo_tax`,
`lineorder`.`lo_commitdate`,
`lineorder`.`lo_shipmode`,
`lineorder`.`lo_extendedprice`*`lineorder`.`lo_discount` AS `V_REVENUE`
FROM `HBASE`.`LINEORDER`;
