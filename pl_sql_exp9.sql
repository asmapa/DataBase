SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION grade_value(p_grade IN VARCHAR2)
RETURN NUMBER IS
BEGIN
    CASE p_grade
        WHEN 'S' THEN RETURN 100;
        WHEN 'A+' THEN RETURN 90;
        WHEN 'A' THEN RETURN 80;
        WHEN 'B+' THEN RETURN 70;
        WHEN 'B' THEN RETURN 60;
        WHEN 'C+' THEN RETURN 50;
        WHEN 'C' THEN RETURN 40;
        WHEN 'F' THEN RETURN 0;
        ELSE RETURN NULL;
    END CASE;
END grade_value;
/


CREATE TABLE student_grades(
    student_name VARCHAR2(30),
    student_id VARCHAR2(10),
    term NUMBER,
    subject_title VARCHAR2(30),
    subject_code VARCHAR2(10),
    credits NUMBER,
    internal_marks NUMBER,
    final_grade VARCHAR2(2),
    PRIMARY KEY(student_id, term, subject_code)
);

CREATE TABLE term_sgpa(
    student_id VARCHAR2(10),
    term NUMBER,
    sgpa NUMBER(4,2)
);

CREATE TABLE overall_cgpa(
    student_id VARCHAR2(10),
    cgpa NUMBER(4,2)
);


CREATE OR REPLACE TRIGGER trg_update_scores
    BEFORE INSERT OR UPDATE
    ON student_grades
    FOR EACH ROW
DECLARE
    CURSOR grade_cursor(c_student_id VARCHAR2, c_term NUMBER) IS
        SELECT credits, final_grade FROM student_grades 
        WHERE student_id = c_student_id AND term = c_term;

    credit_sum NUMBER := 0;
    sgpa_total NUMBER(5,2) := 0;
    sgpa_calculated NUMBER(4,2);
    cgpa_total NUMBER(5,2);
    term_count NUMBER;
    record_exists NUMBER;

BEGIN
 
    sgpa_total := :NEW.credits * grade_value(:NEW.final_grade) / 10;
    credit_sum := :NEW.credits;
    
    FOR g_rec IN grade_cursor(:NEW.student_id, :NEW.term) LOOP
        credit_sum := credit_sum + g_rec.credits;
        sgpa_total := sgpa_total + (g_rec.credits * grade_value(g_rec.final_grade) / 10);
    END LOOP;
    
    sgpa_calculated := TRUNC(sgpa_total / credit_sum, 2);

 
    SELECT COUNT(*) INTO record_exists 
    FROM term_sgpa WHERE student_id = :NEW.student_id AND term = :NEW.term;
    
    IF record_exists = 0 THEN
        INSERT INTO term_sgpa (student_id, term, sgpa) 
        VALUES (:NEW.student_id, :NEW.term, sgpa_calculated);
    ELSE
        UPDATE term_sgpa 
        SET sgpa = sgpa_calculated 
        WHERE student_id = :NEW.student_id AND term = :NEW.term;
    END IF;

 
    SELECT SUM(sgpa), COUNT(*) INTO cgpa_total, term_count 
    FROM term_sgpa WHERE student_id = :NEW.student_id;
    
    cgpa_total := TRUNC(cgpa_total / term_count, 2);

 
    SELECT COUNT(*) INTO record_exists 
    FROM overall_cgpa WHERE student_id = :NEW.student_id;

    IF record_exists = 0 THEN
        INSERT INTO overall_cgpa (student_id, cgpa) 
        VALUES (:NEW.student_id, cgpa_total);
    ELSE
        UPDATE overall_cgpa 
        SET cgpa = cgpa_total 
        WHERE student_id = :NEW.student_id;
    END IF;
    
END trg_update_scores;
/

