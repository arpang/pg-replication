Send an email to IT with your docker hub username to add to you to docker's paid subscription

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
