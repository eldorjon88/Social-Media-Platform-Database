SELECT email, COUNT(*) AS follower_count
FROM users u
JOIN followers f ON u.id = f.following_id
GROUP BY u.id, u.email
ORDER BY follower_count DESC
LIMIT 5;

SELECT *
FROM users u
JOIN profiles p ON p.user_id = u.id AND p.bio IS NOT NULL;









SELECT f.follower_id, u.username
FROM followers f
JOIN users u ON f.follower_id = u.id
WHERE f.following_id = :user_id;

SELECT f.following_id, u.username
FROM followers f
JOIN users u ON f.following_id = u.id
WHERE f.follower_id = :user_id;

SELECT u.username, COUNT(f.following_id) AS following_count
FROM users u
JOIN followers f ON u.id = f.follower_id
GROUP BY u.id
ORDER BY following_count DESC
LIMIT 1;

SELECT a.follower_id, a.following_id
FROM followers a
JOIN followers b ON a.follower_id = b.following_id
                AND a.following_id = b.follower_id;

SELECT f1.follower_id, f1.following_id,
       COUNT(*) AS mutual_followers_count
FROM followers f1
JOIN followers f2 ON f1.follower_id = f2.following_id
                 AND f1.following_id = f2.follower_id
GROUP BY f1.follower_id, f1.following_id;
