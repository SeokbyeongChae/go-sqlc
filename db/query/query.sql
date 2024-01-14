/* name: GetAccount :one */
SELECT * FROM accounts
WHERE id = ? LIMIT 1;

/* name: ListAccounts :many */
SELECT * FROM accounts
ORDER BY id
LIMIT ?
OFFSET ?;

/* name: CreateAccount :execresult */
INSERT INTO accounts (
  owner,
  balance,
  currency
) VALUES (
  ?, ?, ?
);

/* name: UpdateAccount :one */
UPDATE accounts
SET balance = ?
WHERE id = ?;