CREATE TYPE tag_type AS (
    flawCount INT,
    weakPawdCount INT,
    verSuccess INT,
    useSuccess INT
);
CREATE TYPE asset_type AS (
    switch INT,
    industrial INT,
    lot INT,
    other INT
);
CREATE TYPE mid_type AS (
    ipData character varying,
    portData character varying,
    flawData character varying,
    weakPawdData character varying,
    pocData character varying,
    expData character varying,
    vendorData character varying,
    osData character varying
);
CREATE TABLE centable1 (
    id serial PRIMARY KEY,
    tags tag_type,
    assets asset_type,
    mids mid_type
);
CREATE TYPE wpasswd_type AS (
    wp_type varchar(32),
    wp_text int,
    wp_data character varying
);
CREATE TYPE lhole_type AS (
    lh_type varchar(32),
    lh_text int,
    lh_data character varying
);
CREATE TYPE poc_type AS (
    poc_type varchar(32),
    poc_text int,
    poc_data character varying
);
CREATE TYPE exp_type AS (
    exp_type varchar(32),
    exp_text int,
    exp_data character varying
);
CREATE TYPE operate_type AS (
    op_type varchar(32),
    op_text varchar(32)
);
CREATE TABLE centable2 (
    id serial PRIMARY KEY,
    target inet,
    port int,
    service varchar(32),
    vendor varchar(32),
    os varchar(32),
    equipment varchar(32),
    weakpasswd wpasswd_type,
    loophole lhole_type,
    poc poc_type,
    eexp exp_type,
    operate operate_type 
);
