CREATE TABLE main_user (
    id serial PRIMARY KEY,
    ip varchar(32),
    port int,
    service_name varchar(32),
    vendor varchar(64),
    os varchar(32),
    equip_type varchar(64),
    asset int,
    operate varchar(32),
    bug_count int,
    weak_pawd_count int,
    poc_count int,
    exp_count int
);
CREATE TABLE weak_pawd_table (
    id serial PRIMARY KEY,
    ip varchar(32),
    username varchar(32),
    passwd varchar(64)
);
CREATE TABLE poc_table (
    id serial PRIMARY KEY,
    risk_level int,
    poc_name varchar(64),
    poc_type varchar(64),
    poc_vendor varchar(64)
);
CREATE TABLE bug_table (
    id serial PRIMARY KEY,
    bug_level int,
    bug_name varchar(64),
    bug_class varchar(32),
    bug_type varchar(32)
);
