-- hive-env.sh export HIVE_AUX_JARS_PATH=${HIVE_AUX_JARS_PATH},/usr/hdp/current/phoenix-client/phoenix-hive.jar
-- hive_conumns:PHOENIX_COLUMNS "phoenix.column.mapping" = "id:ID,name:NAME,age:AGE,address:ADDRESS" or ERROR 504 (42703): Undefined column
CREATE TABLE `test.test_phoenix`(
  `id` int,
  `name` string,
  `age` int,
  `address` string)
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "test.test_hive",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "id",
	  "phoenix.column.mapping" = "id:ID,name:NAME,age:AGE,address:ADDRESS",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);

-- HiveOnPhoenix
CREATE TABLE `phoenix.customer`(
  `c_custkey` int,
  `c_name` string,
  `c_address` string,
  `c_city` string,
  `c_nation` string,
  `c_region` string,
  `c_phone` string,
  `c_mktsegment` string)
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "hive.customer",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "c_custkey",
	  "phoenix.column.mapping" = "c_custkey:C_CUSTKEY,c_name:C_NAME,c_address:C_ADDRESS,c_city:C_CITY,c_nation:C_NATION,c_region:C_REGION,c_phone:C_PHONE,c_mktsegment:C_MKTSEGMENT",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);
CREATE TABLE `phoenix.dates`(
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
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "hive.dates",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "d_datekey",
	  "phoenix.column.mapping" = "d_datekey:D_DATEKEY,d_date:D_DATE,d_dayofweek:D_DAYOFWEEK,d_month:D_MONTH,d_year:D_YEAR,d_yearmonthnum:D_YEARMONTHNUM,d_yearmonth:D_YEARMONTH,d_daynuminweek:D_DAYNUMINWEEK,d_daynuminmonth:D_DAYNUMINMONTH,d_daynuminyear:D_DAYNUMINYEAR,d_monthnuminyear:D_MONTHNUMINYEAR,d_weeknuminyear:D_WEEKNUMINYEAR,d_sellingseason:D_SELLINGSEASON,d_lastdayinweekfl:D_LASTDAYINWEEKFL,d_lastdayinmonthfl:D_LASTDAYINMONTHFL,d_holidayfl:D_HOLIDAYFL,d_weekdayfl:D_WEEKDAYFL",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);
CREATE TABLE `phoenix.lineorder`(
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
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "hive.lineorder",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "lo_orderkey",
	  "phoenix.column.mapping" = "lo_orderkey:LO_ORDERKEY,lo_linenumber:LO_LINENUMBER,lo_custkey:LO_CUSTKEY,lo_partkey:LO_PARTKEY,lo_suppkey:LO_SUPPKEY,lo_orderdate:LO_ORDERDATE,lo_orderpriotity:LO_ORDERPRIOTITY,lo_shippriotity:LO_SHIPPRIOTITY,lo_quantity:LO_QUANTITY,lo_extendedprice:LO_EXTENDEDPRICE,lo_ordtotalprice:LO_ORDTOTALPRICE,lo_discount:LO_DISCOUNT,lo_revenue:LO_REVENUE,lo_supplycost:LO_SUPPLYCOST,lo_tax:LO_TAX,lo_commitdate:LO_COMMITDATE,lo_shipmode:LO_SHIPMODE",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);
CREATE TABLE `phoenix.part`(
  `p_partkey` int,
  `p_name` string,
  `p_mfgr` string,
  `p_category` string,
  `p_brand` string,
  `p_color` string,
  `p_type` string,
  `p_size` int,
  `p_container` string)
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "hive.part",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "p_partkey",
	  "phoenix.column.mapping" = "p_partkey:P_PARTKEY,p_name:P_NAME,p_mfgr:P_MFGR,p_category:P_CATEGORY,p_brand:P_BRAND,p_color:P_COLOR,p_type:P_TYPE,p_size:P_SIZE,p_container:P_CONTAINER",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);

CREATE TABLE `phoenix.supplier`(
  `s_suppkey` int,
  `s_name` string,
  `s_address` string,
  `s_city` string,
  `s_nation` string,
  `s_region` string,
  `s_phone` string)
STORED BY 'org.apache.phoenix.hive.PhoenixStorageHandler'
TBLPROPERTIES (
	  "phoenix.table.name" = "hive.supplier",
	  "phoenix.zookeeper.quorum" = "h11.bdiiot.com,h12.bdiiot.com,h13.bdiiot.com",
	  "phoenix.zookeeper.znode.parent" = "/hbase-secure",
	  "phoenix.zookeeper.client.port" = "2181",
	  "phoenix.rowkeys" = "s_suppkey",
	  "phoenix.column.mapping" = "s_suppkey:S_SUPPKEY,s_name:S_NAME,s_address:S_ADDRESS,s_city:S_CITY,s_nation:S_NATION,s_region:S_REGION,s_phone:S_PHONE",
	  "phoenix.table.options" = "SALT_BUCKETS=10, DATA_BLOCK_ENCODING='DIFF'"
	);

CREATE VIEW `phoenix.p_lineorder` AS SELECT `lineorder`.`lo_orderkey`,
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
FROM `PHOENIX`.`LINEORDER`

-- Phoenix
CREATE VIEW hive.p_lineorder AS SELECT 
lo_orderkey,
lo_linenumber,
lo_custkey,
lo_partkey,
lo_suppkey,
lo_orderdate,
lo_orderpriotity,
lo_shippriotity,
lo_quantity,
lo_extendedprice,
lo_ordtotalprice,
lo_discount,
lo_revenue,
lo_supplycost,
lo_tax,
lo_commitdate,
lo_shipmode,
lo_extendedprice*lo_discount AS V_REVENUE
FROM hive.LINEORDER
