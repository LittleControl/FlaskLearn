INSERT INTO ccenter (tags, assets, mids)
VALUES(
    ROW(2, 3, 4, 5),
    ROW(3, 4, 5 ,6),
    ROW(
        ARRAY[("IPD1", "127.0.0.1", 32), ("IPT2", "192.168.1.1", 11)]
    )    
);
