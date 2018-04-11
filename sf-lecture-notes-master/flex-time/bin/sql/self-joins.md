# Self-Joins

Self joins are very similar to [joins](./joins.md) but the key lies in the proper aliasing of tables (or rather, table)

  * Since you are only using one table, it is extremely useful to use aliasing to make the relationship clearer.

Example: 

```sql
SELECT
  name
FROM
  employees AS subordinates
JOIN
  employees AS managers ON subordinates.manager_id = managers.id
WHERE
  managers.name = 'Jeff'
```

From SQLZoo:

```rb
def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
    SELECT DISTINCT
      start_routes.company,
      start_routes.num
    FROM
      routes AS start_routes
    JOIN
      routes AS end_routes ON start_routes.company = end_routes.company
        AND start_routes.num = end_routes.num
    WHERE
      start_routes.stop_id = 115 AND end_routes.stop_id = 137
  SQL
end
```