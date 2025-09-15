SELECT *
FROM users
ORDER BY created_at DESC;


SELECT * FROM users
ORDER BY created_at DESC;

SELECT u.username, COUNT(f.follower_id) AS followers_count
FROM users u
LEFT JOIN followers f ON u.id = f.following_id
GROUP BY u.id
ORDER BY followers_count DESC
LIMIT 1;

SELECT u.username, COUNT(f.follower_id) AS followers_count
FROM users u
LEFT JOIN followers f ON u.id = f.following_id
GROUP BY u.id;

SELECT * FROM users
WHERE bio IS NOT NULL AND bio <> '';

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

SELECT * FROM messages
WHERE sender_id = :user_id;

SELECT * FROM messages
WHERE (sender_id = :user1 AND receiver_id = :user2)
   OR (sender_id = :user2 AND receiver_id = :user1)
ORDER BY created_at;

SELECT u.username, COUNT(m.id) AS sent_messages
FROM users u
LEFT JOIN messages m ON u.id = m.sender_id
GROUP BY u.id;

SELECT u.username, COUNT(m.id) AS sent_messages
FROM users u
LEFT JOIN messages m ON u.id = m.sender_id
GROUP BY u.id
ORDER BY sent_messages DESC
LIMIT 1;

SELECT u.username,
       COUNT(DISTINCT p.id) AS total_posts,
       COUNT(DISTINCT c.id) AS total_comments,
       COUNT(DISTINCT l.post_id) AS total_likes
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id;

SELECT u.username,
       (COUNT(DISTINCT p.id) + COUNT(DISTINCT c.id) + COUNT(DISTINCT l.post_id)) AS activity_score
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id
ORDER BY activity_score DESC
LIMIT 1;

SELECT p.id AS post_id, p.content, u.username, COUNT(l.user_id) AS like_count
FROM posts p
JOIN users u ON p.user_id = u.id
LEFT JOIN likes l ON p.id = l.post_id
WHERE p.user_id IN (
    SELECT following_id FROM followers WHERE follower_id = :user_id
)
