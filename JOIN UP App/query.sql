CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');
SELECT * FROM users;
INSERT INTO users (email) VALUES ("sadsadsa@gmail.com");
SELECT DATE_FORMAT(created_at, '%b %D %Y') FROM users ORDER BY created_at LIMIT 1;
SELECT email, created_at FROM users WHERE created_at = (SELECT created_at FROM users ORDER BY created_at LIMIT 1);
SELECT DATE_FORMAT(created_at, '%M') as month, COUNT(email) as total FROM users
GROUP BY DATE_FORMAT(created_at, '%M')
ORDER BY total DESC; 
SELECT COUNT(email) FROM users 
WHERE email LIKE '%yahoo%';