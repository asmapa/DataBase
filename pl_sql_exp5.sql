set serveroutput on;
set autocommit on; 

accept n prompt 'Enter n: '; 

create table primes (
    pr int
);

create table composite (
    compo int
);

create or replace function is_prime (n in number)
return boolean is
begin
    if (n < 2) then
        return false;
    end if;

    for i in 2 .. floor(sqrt(n)) loop
        if mod(n, i) = 0 then
            return false;
        end if;
    end loop;

    return true;
end is_prime;
/

declare
    i number := 0;
    var1 number := 2;
begin
    while i < &n loop
        if is_prime(var1) then
            insert into primes values (var1);
            i := i + 1;
        end if;
        var1 := var1 + 1;
    end loop;

    i := 0;
    var1 := 2;

    while i < &n loop
        if not is_prime(var1) then
            insert into composite values (var1);
            i := i + 1;
        end if;
        var1 := var1 + 1;
    end loop;

    dbms_output.put_line('prime numbers are: ');
    for rec in (select pr from primes) loop
        dbms_output.put_line(rec.pr);
    end loop;

    dbms_output.put_line('composite numbers are: ');
    for rec in (select compo from composite) loop
        dbms_output.put_line(rec.compo);
    end loop;

    drop table primes;
    drop table composite;
  
end;
/

