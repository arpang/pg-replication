INSERT INTO emp_id (id) 
SELECT g.id FROM generate_series(1, 10000) AS g (id);