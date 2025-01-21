/*CREATE TABLE emp (
    empid int PRIMARY KEY,
    empname VARCHAR2(50),
    salary NUMBER
);


CREATE TABLE incre (
    empid NUMBER,
    incr NUMBER,
     FOREIGN KEY (empid) REFERENCES Employee(empid)
);*/

--ORACLE APEX

CREATE OR REPLACE TRIGGER incre_trigger
AFTER UPDATE OF salary ON emp
FOR EACH ROW
BEGIN
    IF abs(:NEW.salary - :OLD.salary) > 1000 THEN
        INSERT INTO incre(empid, incr)
        VALUES (:NEW.empid, :NEW.salary - :OLD.salary);
    END IF;
END;

