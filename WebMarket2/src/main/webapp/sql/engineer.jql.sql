-- engineer 테이블 생성
CREATE TABLE engineer(
	eid 	INT PRIMARY KEY AUTO_INCREMENT,
	passwd	VARCHAR(20)	NOT NULL,
	name	VARCHAR(20)
);

-- 자료 입력
INSERT INTO engineer VALUES(11, 'm1234','Bill');

SELECT * FROM engineer;