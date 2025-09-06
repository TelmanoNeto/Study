-- Questao 01:
    CREATE VIEW vw_dptmgr AS SELECT d.dnumber, e.fname FROM department d, employee e WHERE d.mgrssn = e.ssn;
    CREATE VIEW vw_empl_houston AS SELECT e.ssn, e.fname FROM employee e WHERE e.address LIKE '%Houston%';
    CREATE VIEW vw_deptstats AS SELECT d.dnumber, d.dname, COUNT(DISTINCT w.essn) AS total_funcionarios FROM department d, works_on w, project p WHERE w.pno = p.pnumber AND p.dnum = d.dnumber GROUP BY d.dnumber,d.dname;
    CREATE VIEW vw_projstats AS SELECT p.pnumber, COUNT(DISTINCT w.essn) FROM project p, works_on w WHERE w.pno = p.pnumber GROUP BY p.pnumber;

-- Questao 02:
    SELECT * FROM vw_dptmgr;
    SELECT * FROM vw_empl_houston;
    SELECT * FROM vw_deptstats;
    SELECT * FROM vw_projstats;

--Questão 03:
    DROP VIEW vw_dptmgr ;
    DROP VIEW vw_empl_houston ;
    DROP VIEW vw_deptstats;
    DROP VIEW vw_projstats;

--Questao 04:
    CREATE OR REPLACE FUNCTION check_age(employeessn CHAR)
    RETURNS VARCHAR(7) AS
    $$

    DECLARE
        employee_age INTEGER;

    BEGIN

    SELECT date_part('year', AGE(CURRENT_DATE, e.bdate)) INTO employee_age FROM employee e WHERE e.ssn = employeessn;

        IF (employee_age >= 50) THEN RETURN 'SENIOR';
        ELSIF (employee_age < 50 AND employee_age >= 0) THEN RETURN 'YOUNG';
        ELSIF (employee_age < 0) THEN RETURN 'INVALID';
        ELSE RETURN 'UNKNOWN';
        END IF;

    END;
    $$  LANGUAGE plpgsql;

--Questao 05:
CREATE OR REPLACE FUNCTION check_mgr () 
RETURNS trigger AS
$$
    DECLARE
        emp_dno INTEGER;
        emp_num_sub INTEGER;
        emp_type VARCHAR(7);
    BEGIN

        SELECT e.dno, count(s), check_age(e.ssn)
        INTO emp_dno, emp_num_sub, emp_type
        FROM employee e LEFT OUTER JOIN employee s ON e.ssn = s.superssn
        WHERE e.ssn = NEW.mgrssn
        GROUP BY e.ssn; 

        IF emp_dno <> NEW.dnumber OR emp_dno IS NULL THEN
            RAISE EXCEPTION 'manager must be a department''s employee';
        END IF;

        IF emp_num_sub = 0 THEN
            RAISE EXCEPTION 'manager must have supevisees';
        END IF;

        IF emp_type <> 'SENIOR' THEN
            RAISE EXCEPTION 'manager must be a SENIOR employee';
        END IF;

        RETURN NEW;

    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_mgr
BEFORE INSERT OR UPDATE OF mgrssn, dnumber ON department
FOR EACH ROW EXECUTE FUNCTION check_mgr();