USE modw_supremm;

CREATE TABLE IF NOT EXISTS etl_uid (
    id INT PRIMARY KEY AUTO_INCREMENT,
    uuid VARCHAR(128) NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL
);

INSERT INTO etl_uid (uuid, valid_from, valid_to)
    SELECT * FROM (SELECT UUID(), FROM_UNIXTIME(0), FROM_UNIXTIME(2147483647)) AS tmp
    WHERE NOT EXISTS (SELECT * FROM etl_uid) LIMIT 1;
