Send an email to IT with your docker hub username to add you to docker's paid subscription

Install docker desktop: https://docs.docker.com/desktop/mac/install/

Docker commands:
- Create and start containers: `docker-compose up -d`
- Access container shell: `docker exec -it <container id> /bin/bash`
- Stop and remove containers: `docker-compose down`


PG commands:
- Postgres shell: `psql -U postgres`
- Check wal level: `SHOW wal_level;`
- Create publication: `CREATE PUBLICATION my_publication FOR TABLE emp_id;`
- Create subscription: `CREATE SUBSCRIPTION my_subscription CONNECTION 'host=host.docker.internal port=5432 dbname=postgres password=postgres user=postgres' PUBLICATION my_publication;`
- Check publications (in publisher): `select * from pg_publication;`
- Check subscriptions (in subscriber): `select * from pg_subscription;`
- Check replication slots (in publisher): `SELECT * FROM pg_replication_slots;`


Steps to setup one publisher and two subscribers replication:
- Start the containers, it will spin up three PG instances namely `pub`, `sub1` and `sub2` at ports 5432, 5433 and 5434 respectively.
- Verify that the wal_level is set to `logical` (by running `SHOW wal_level;`) in each of the PG instances.
- Verify that `emp_id` table exist in each of the instances. Table in `pub` instance should contain 10K rows and should be empty in the other two.
- Create a publication in `pub` instance: 

    `CREATE PUBLICATION my_publication FOR TABLE emp_id;`

- Create subcriptions in `sub1` and `sub2` instances:

    `CREATE SUBSCRIPTION my_subscription1 CONNECTION 'host=host.docker.internal port=5432 dbname=postgres password=postgres user=postgres' PUBLICATION my_publication;`

    `CREATE SUBSCRIPTION my_subscription2 CONNECTION 'host=host.docker.internal port=5432 dbname=postgres password=postgres user=postgres' PUBLICATION my_publication;`

- You should see table `empd_id` getting replicated from `pub` to `sub1` and `sub2`.
