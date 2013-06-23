DECLARE

   CURSOR employees_cur IS
      SELECT e.employee_id,
             e.first_name,
             e.last_name,
             e.salary
      FROM employees e;

   TYPE emp_type IS TABLE OF employees_cur%ROWTYPE
      INDEX BY PLS_INTEGER;

   laa_emps emp_type;

   lkn_batchsize CONSTANT NUMBER(3) := 100;

BEGIN

   OPEN employees_cur;

   LOOP

      FETCH employees_cur BULK COLLECT INTO laa_emps LIMIT lkn_batchsize;

      FOR i IN 1 .. laa_emps.COUNT()
      LOOP

         -- do something interesting with each employee record
         null;

      END LOOP;

      EXIT WHEN laa_emps.COUNT() < lkn_batchsize;

   END LOOP;

   CLOSE employees_cur;

END;
