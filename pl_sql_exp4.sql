set serveroutput on;
set autocommit on;

accept n prompt 'Enter n: ';

CREATE TABLE ps (
    square INT
);

CREATE TABLE pc (
    cubes INT
);

declare
    i number := 1;
    var1 number;
    var2 number;
begin
    while i <= &n loop
        var1 := sqrt(i);
        var2 := power(i, 1/3);

        if var1 = trunc(var1) then
            insert into ps values (i);
        end if;

        if var2 = trunc(var2) then
            insert into pc values (i);
        end if;

        i := i + 1;
    end loop;

    commit;
end;
/

declare
    cursor c1 is select square from ps;
    cursor c2 is select cubes from pc;
    
    c1_record c1%rowtype;
    c2_record c2%rowtype;
begin
    dbms_output.put_line('squares:');
    open c1;
    loop
        fetch c1 into c1_record;
        exit when c1%notfound;
        dbms_output.put_line(c1_record.square);
    end loop;
    close c1;

    dbms_output.put_line('cubes:');
    open c2;
    loop
        fetch c2 into c2_record;
        exit when c2%notfound;
        dbms_output.put_line(c2_record.cubes);
    end loop;
    close c2;
end;
/

