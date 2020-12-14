CREATE TYPE tag AS (
    flawCount       INT,
    weakPawdCount   INT,
    verSuccess      INT,
    useSuccess      INT
);
CREATE TYPE asset AS (
    switch          INT,
    industrial      INT,
    lot             INT,
    other           INT
);
CREATE TYPE ipType  AS (
    id              VARCHAR(32),
    ip              inet,
    serviceCount    INT    
);
CREATE TYPE portType AS (
    id          VARCHAR(32),
    port        INT,
    pcount      INT
);
CREATE TYPE flawType AS (
    id          VARCHAR(32),
    "name"      VARCHAR(64),
    url         TEXT
);
CREATE TYPE weakPawdtype AS (
    id          VARCHAR(32),
    "name"      VARCHAR(64),
    url         TEXT
);
CREATE TYPE pocType AS (
    id          VARCHAR(32),
    "name"      VARCHAR(64),
    url         TEXT
);
CREATE TYPE expType AS (
    id          VARCHAR(32),
    "name"      VARCHAR(64),
    url         TEXT
);
CREATE TYPE vendorType AS (
    id          VARCHAR(32),
    vendor      VARCHAR(64),
    assetCount  INT
);
CREATE TYPE osType AS (
    id          VARCHAR(32),
    os          VARCHAR(64),
    ocount      INT
);
CREATE TYPE mid  AS (
    ipData          ipType[],
    portData        portType[],
    flawData        flawType[],
    weakPawdData    weakPawdType[],
    pocData         pocType[],
    expData         expType[],
    vendorData      vendorType[],
    osData          osType[]
);
CREATE TYPE weakDataType (
    id          VARCHAR(32),
    ip          INET,
    username    VARCHAR(64),
    passwd      VARCHAR(64)
);
CREATE TYPE weakpasswdType (
    type        VARCHAR(32),
    TEXT        INT,
    data        weakDataType[]
);
CREATE TYPE appType AS (
    id          VARCHAR(32),
    target      INET,
    port        INT,
    service     VARCHAR(32),
    vendor      VARCHAR(32),
    os          VARCHAR(32),
    equiptype   VARCHAR(32),
    weakpasswd  weakpasswdType[]
);
CREATE TABLE ccenter (
    tags        tag,
    assets      asset,
    mids        mid
);









