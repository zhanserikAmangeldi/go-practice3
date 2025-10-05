# Commands to fast checking

```
docker compose up -d
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "\dt"
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "SELECT * FROM users;"
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "SELECT * FROM categories;"
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "SELECT * FROM expenses;"
docker exec -it postgres_db psql -U postgres -d expense_tracker -c "SELECT * FROM schema_migrations;"
docker compose down -v
```
