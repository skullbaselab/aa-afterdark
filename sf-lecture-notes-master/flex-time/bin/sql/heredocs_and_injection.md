# Heredocs and SQL Injection

* If you use a `?` or key-value pair to pass in variables to a SQL query, SQLite3 will help protect against SQL injection attempts by escaping potentially malicious code for you.

* Without this protection, a malicious user could insert any string they wanted into your SQL code, tricking your interpreter into executing code you did not intend (for example, `';DROP TABLE users;--`)

```sql
db.execute(<<-SQL, post_id)
SELECT
  *
FROM
  posts
JOIN
  comments ON comments.post_id = posts.id
WHERE
  posts.id = ?
SQL
```

Using key-value pairs:

```sql
db.execute(<<-SQL, post_id: post_id)
SELECT
  *
FROM
  posts
JOIN
  comments ON comments.post_id = posts.id
WHERE
  posts.id = :post_id
SQL
```

Why use key-value pairs over `?` strings? When using `?`, the ordering of the arguments matters. With key-value pairs, because a key exists, the symbol (in this case `:post_id`) looks for the argument by its key.