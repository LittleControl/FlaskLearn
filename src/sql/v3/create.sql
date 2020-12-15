CREATE TYPE tag_type AS (
    flaw_count INT,
    weak_pawd_count INT,
    ver_success INT,
    use_success INT
);
CREATE TYPE asset_type AS (
    switch INT,
    industrial INT,
    lot INT,
    other INT
);
CREATE TYPE mid_type AS (
    ip_data character varying,
    port_data character varying,
    flaw_data character varying,
    weak_pawd_data character varying,
    poc_data character varying,
    exp_data character varying,
    vendor_data character varying,
    os_data character varying
);
CREATE TABLE centable1 (
    id serial PRIMARY KEY,
    tags tag_type,
    assets asset_type,
    mids mid_type
);
CREATE TYPE wpasswd_type AS (
    wp_type varchar(32),
    wp_text varchar(32),
    wp_data character varying
);
CREATE TYPE lhole_type AS (
    lh_type varchar(32),
    lh_text varchar(32),
    lh_data character varying
);
CREATE TYPE poc_type AS (
    poc_type varchar(32),
    poc_text varchar(32),
    poc_data character varying
);
CREATE TYPE exp_type AS (
    exp_type varchar(32),
    exp_text varchar(32),
    exp_data character varying
);
CREATE TYPE operate_type AS (
    op_type varchar(32),
    op_text varchar(32)
);
CREATE TABLE centable2 (
    id serial PRIMARY KEY,
    target varchar(32),
    port int,
    service varchar(32),
    vendor varchar(32),
    os varchar(32),
    equipment varchar(32),
    weakpasswd wpasswd_type,
    loophole lhole_type,
    poc poc_type,
    my_exp exp_type,
    operate operate_type 
);
