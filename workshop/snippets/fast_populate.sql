CREATE TABLE test ( 
	id   INT NOT NULL AUTO_INCREMENT, 
	last_name  VARCHAR(255) NOT NULL, 
	first_name VARCHAR(255) NOT NULL, 
	PRIMARY KEY (id) 
);

CREATE INDEX first_name_index ON test (first_name);
-- And then add index for last_name


drop procedure prepare_data;
delete from test where id>0;

DELIMITER $$
CREATE PROCEDURE prepare_data()
BEGIN
  DECLARE i INT DEFAULT 1;
  SET @insert_query = 'INSERT INTO test (first_name, last_name) VALUES ("a","a") ';

  WHILE i < 10000 DO
    SET @insert_query = CONCAT(@insert_query, ', (', '"', concat( MD5(RAND()), MD5(RAND()) ), '","', 
	concat( MD5(RAND()), MD5(RAND()), '") ' ));
    SET i = i + 1;
  END WHILE;

  PREPARE stmt1 FROM @insert_query;
  EXECUTE stmt1;
  DEALLOCATE PREPARE stmt1;
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE prepare_times(IN times INT(4))
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < times DO
    call prepare_data();
    SET i = i + 1;
  END WHILE;
END
$$
DELIMITER ;

call prepare_data();




SHOW TABLE STATUS WHERE Name = 'test'\G;

-- Test ~1 sec execution on 250000 unindexed rows
SELECT count(id) FROM test WHERE last_name LIKE '%c%a%f' AND first_name LIKE '%fa%';


