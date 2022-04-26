\c demo;
INSERT INTO org_id (id) SELECT g.id FROM generate_series(1, 10000) AS g (id);