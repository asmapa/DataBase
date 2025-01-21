SET SERVEROUTPUT ON;



DECLARE 
  n number;
  res number := 0;
  num_digits number := 0;
  digit number;
  temp number;

BEGIN
   n := 153;
   if n is null or n < 0 then
     DBMS_OUTPUT.PUT_LINE('Enter valid positive number');
     return;
   end if;

   temp := n;
   while temp > 0
    loop
      temp := trunc(temp/10);
      num_digits := num_digits + 1;
    end loop;
    
    DBMS_OUTPUT.PUT_LINE(num_digits|| ':- number of digits...');

    temp := n;

    while temp > 0 
     loop
       digit := mod(temp, 10);
       res := res + power(digit,num_digits);
       temp := trunc(temp/10);
     end loop;

     if res = n then
      DBMS_OUTPUT.PUT_LINE(n|| ' is a narcissistic number');
     else
      DBMS_OUTPUT.PUT_LINE(n|| ' is not a narcissistic number');
     end if;
       
END;
/