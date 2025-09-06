--1
SELECT * FROM department;
--2
SELECT * FROM dependent;
--3
SELECT * FROM dept_locations;
--4
SELECT * FROM employee;
--5
SELECT * FROM project;
--6
SELECT * FROM works_on;
--7
SELECT fname, lname FROM employee;
--8
SELECT fname FROM employee WHERE superssn IS NOT NULL;
--9
SELECT e.fname ename, s.fname supname
FROM employee e 
JOIN employee s ON e.superssn = s.ssn 
WHERE e.superssn IS NOT NULL;
--10
SELECT e.fname ename, s.fname supname
FROM employee e 
JOIN employee s ON e.superssn = s.ssn AND s.fname = 'Franklin'
WHERE e.superssn IS NOT NULL;
--11
SELECT d.dname, dl.dlocation
FROM department d
JOIN dept_locations dl ON d.dnumber = dl.dnumber;
--12
SELECT d.dname, dl.dlocation
FROM department d
JOIN dept_locations dl ON d.dnumber = dl.dnumber
WHERE dl.dlocation LIKE 'S%';
--13
SELECT e.fname, e.lname, dep.dependent_name
FROM employee e
JOIN dependent dep ON e.ssn = dep.essn;
--14
SELECT fname || ' ' || minit ||' '|| lname full_name, salary
FROM employee
WHERE salary >= 50000;
--15
SELECT p.pname, d.dname
FROM project p
JOIN department d ON p.dnum = d.dnumber;
--16
SELECT p.pname, e.fname
FROM project p
JOIN department d ON p.dnum = d.dnumber
JOIN employee e ON e.ssn = d.mgrssn
WHERE p.pnumber >= 30;

--Roteiro 4
--1
SELECT COUNT (*)
FROM employee
WHERE sex = 'F';
--2
SELECT AVG(salary)
FROM employee
WHERE sex = 'M' AND address LIKE '%TX';
--3
SELECT e.superssn ssn_supervisor, COUNT(e.ssn) qtd_supervisionados
FROM employee s
LEFT JOIN employee e ON e.superssn = s.ssn
GROUP BY e.superssn
ORDER BY qtd_supervisionados;
--4
SELECT s.fname nome_supervisor, COUNT(e.ssn) qtd_supervisionados
FROM employee s
JOIN employee e ON e.superssn = s.ssn
GROUP BY s.fname
ORDER BY qtd_supervisionados;
--5
SELECT 
    s.ssn AS ssn_supervisor,
    COUNT(e.ssn) AS quantidade_funcionarios_supervisionados
FROM 
    employee s
LEFT JOIN 
    employee e ON s.ssn = e.superssn
GROUP BY 
    s.ssn
--6
SELECT 
    COUNT(w.essn) AS quantidade_pessoas
FROM 
    project p
LEFT JOIN 
    works_on w ON p.pnumber = w.pno
GROUP BY 
    p.pnumber
HAVING 
    COUNT(w.essn) = (
        SELECT MIN(pessoa_count)
        FROM (
            SELECT COUNT(essn) AS pessoa_count
            FROM works_on
            GROUP BY pno
        ) AS contagens
    );
--7
SELECT 
    p.pnumber AS numero_projeto,
    COUNT(w.essn) AS quantidade_pessoas
FROM 
    project p
LEFT JOIN 
    works_on w ON p.pnumber = w.pno
GROUP BY 
    p.pnumber
HAVING 
    COUNT(w.essn) = (
        SELECT MIN(pessoa_count)
        FROM (
            SELECT COUNT(essn) AS pessoa_count
            FROM works_on
            GROUP BY pno
        ) AS contagens
    );
--8
SELECT p.pnumber num_proj, AVG(e.salary) media_sal
FROM project p 
JOIN works_on w ON p.pnumber = w.pno
JOIN employee e ON w.essn = e.ssn
GROUP BY p.pnumber;
--9
SELECT p.pnumber num_proj, p.pname proj_nome, AVG(e.salary) media_sal
FROM project p 
JOIN works_on w ON p.pnumber = w.pno
JOIN employee e ON w.essn = e.ssn
GROUP BY p.pnumber;
--10 
SELECT e.fname, e.salary
FROM employee e 
WHERE e.ssn NOT IN (
    SELECT w.essn
    FROM works_on w 
    WHERE w.pno = 92
    )
    AND e.salary > ALL (
        SELECT e2.salary
        FROM employee e2
        JOIN works_on w2 ON e2.ssn = w2.essn
        WHERE w2.pno = 92
    )
ORDER BY e.salary ASC;
--11
SELECT e.ssn ssn, COUNT(w.essn) qtd_proj
FROM employee e
LEFT JOIN works_on w ON w.essn = e.ssn
GROUP BY e.ssn
ORDER BY COUNT(essn);
--12
SELECT p.pnumber num_proj, COUNT(w.essn) qtd_func
FROM project p
LEFT JOIN works_on w ON w.pno = p.pnumber
GROUP BY p.pnumber
HAVING COUNT(w.essn) < 5
ORDER BY COUNT(w.essn);
--13
SELECT fname
FROM employee e
WHERE e.ssn IN (
    SELECT w.essn
    FROM works_on w
    WHERE w.pno IN (
        SELECT p.pnumber
        FROM project p 
        WHERE p.plocation = 'Sugarland'
    ) AND e.ssn IN (
        SELECT d.essn
        FROM dependent d
    )
);