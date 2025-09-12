SELECT *
FROM posts
WHERE user_id = 3;


SELECT u.email, COUNT(*) AS total_posts
FROM users u
JOIN posts p ON p.user_id = u.id
GROUP BY u.email
ORDER BY total_posts DESC
LIMIT 5;

SELECT *
FROM posts
WHERE created_at >= CURRENT_DATE;
