SET SERVEROUTPUT ON;

DECLARE
  str varchar2(100);
  len number := 0;
  palindrome boolean := true;
  i number;

BEGIN

  str := asma;
  len := length(str);

  for i in 0..trunc(len/2)-1 loop
     if upper(substr(str, i + 1, 1)) != upper(substr(str, len - i, 1)) then
       palindrome := false;
       exit;
     end if;
  end loop;

  if palindrome then
    DBMS_OUTPUT.PUT_LINE('Yahhh,  palindrome');
  else
    DBMS_OUTPUT.PUT_LINE('Not a palindrome');
  end if;
END;
