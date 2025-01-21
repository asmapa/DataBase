/*create table books(
    accno int primary key,
    title varchar(20),
    publisher varchar(20),
    author varchar(20),
    editionss int,
    num_cop int
);*/
--ORACLE APEX

 CREATE OR REPLACE TRIGGER booktriger
AFTER INSERT OR UPDATE OR DELETE ON books
DECLARE
    total_rows NUMBER;
BEGIN
   
    SELECT COUNT(*) INTO total_rows FROM books;
    
  
    DBMS_OUTPUT.PUT_LINE('Total number of rows after insert: ' || total_rows);
END;

