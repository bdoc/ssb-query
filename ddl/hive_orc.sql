-- Hive ORC
create database orc;
create table orc.customer stored as orc as select * from ssb.customer;
create table orc.dates stored as orc as select * from ssb.dates;
create table orc.lineorder stored as orc as select * from ssb.lineorder;
create table orc.part stored as orc as select * from ssb.part;
create table orc.supplier stored as orc as select * from ssb.supplier;
CREATE VIEW `ORC.p_lineorder` AS SELECT `lineorder`.`lo_orderkey`,
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
FROM `ORC`.`LINEORDER`;
