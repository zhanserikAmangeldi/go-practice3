# Commands to fast checking

```
docker compose up -d
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "\dt *.*"
docker compose down -v
```
