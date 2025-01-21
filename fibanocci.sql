DECLARE
  n number := :ENTER_NUM;
  num1 number := 0;
  num2 number := 1;
  num3 number;
  i number;


BEGIN
   if n >= 1 then
     DBMS_OUTPUT.PUT_LINE(num1);
   end if;

   if n >= 2 then
     DBMS_OUTPUT.PUT_LINE(num2);
   end if;


   for i in 3..n loop
     num3 := num1 + num2;
     DBMS_OUTPUT.PUT_LINE(num3);
     num1  := num2;
     num2 := num3;
   end loop;


END;
