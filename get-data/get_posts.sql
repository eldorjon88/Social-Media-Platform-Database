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




SELECT * FROM posts
WHERE user_id = :user_id;

SELECT u.username, COUNT(p.id) AS post_count
FROM users u
JOIN posts p ON u.id = p.user_id
GROUP BY u.id
ORDER BY post_count DESC
LIMIT 5;

SELECT * FROM posts
WHERE created_at >= NOW() - INTERVAL '24 hours';

SELECT p.id, p.content, COUNT(l.user_id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id;

SELECT p.id, p.content, COUNT(l.user_id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id
ORDER BY like_count DESC
LIMIT 3;

SELECT c.content, u.username, c.created_at
FROM comments c
JOIN users u ON c.user_id = u.id
WHERE c.post_id = :post_id;

SELECT u.username, COUNT(c.id) AS comments_count
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
GROUP BY u.id;

SELECT u.username, COUNT(c.id) AS comments_count
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
GROUP BY u.id
ORDER BY comments_count DESC
LIMIT 1;

SELECT u.username, COUNT(c.id) AS comments_count
FROM comments c
JOIN users u ON c.user_id = u.id
WHERE c.post_id = :post_id
GROUP BY u.id
ORDER BY comments_count DESC
LIMIT 3;

SELECT p.id, p.content, p.created_at
FROM likes l
JOIN posts p ON l.post_id = p.id
WHERE l.user_id = :user_id;

SELECT u.username, COUNT(l.post_id) AS liked_posts
FROM users u
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id;

SELECT u.username, COUNT(l.post_id) AS liked_posts
FROM users u
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id
ORDER BY liked_posts DESC
LIMIT 1;

SELECT p.id, p.content, COUNT(l.user_id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id
ORDER BY like_count DESC;

SELECT p.id, p.content, t.name AS tag
FROM posts p
JOIN post_tags pt ON p.id = pt.post_id
JOIN tags t ON pt.tag_id = t.id;

SELECT p.id, p.content, u.username
FROM posts p
JOIN post_tags pt ON p.id = pt.post_id
JOIN tags t ON pt.tag_id = t.id
JOIN users u ON p.user_id = u.id
WHERE t.name = :tag_name;

SELECT t.name, COUNT(pt.post_id) AS usage_count
FROM tags t
JOIN post_tags pt ON t.id = pt.tag_id
GROUP BY t.id
ORDER BY usage_count DESC
LIMIT 1;

SELECT t.name, COUNT(pt.post_id) AS usage_count
FROM tags t
JOIN post_tags pt ON t.id = pt.tag_id
JOIN posts p ON pt.post_id = p.id
WHERE p.user_id = :user_id
GROUP BY t.id
ORDER BY usage_count DESC
LIMIT 1;

SELECT p.id,
       (COUNT(l.user_id)::decimal / NULLIF(f.followers_count,0)) * 100 AS like_ratio
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
LEFT JOIN (
    SELECT u.id, COUNT(f.follower_id) AS followers_count
    FROM users u
    LEFT JOIN followers f ON u.id = f.following_id
    GROUP BY u.id
) f ON p.user_id = f.id
GROUP BY p.id, f.followers_count;

SELECT t.name, COUNT(pt.post_id) AS usage_count
FROM tags t
JOIN post_tags pt ON t.id = pt.tag_id
JOIN posts p ON pt.post_id = p.id
WHERE p.created_at >= NOW() - INTERVAL '30 days'
GROUP BY t.id
ORDER BY usage_count DESC
LIMIT 10;

SELECT p.id, p.content,
       COUNT(DISTINCT l.user_id) + COUNT(DISTINCT c.id) AS popularity_score
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id AND l.created_at >= NOW() - INTERVAL '24 hours'
LEFT JOIN comments c ON p.id = c.post_id AND c.created_at >= NOW() - INTERVAL '24 hours'
WHERE p.created_at >= NOW() - INTERVAL '24 hours'
GROUP BY p.id
ORDER BY popularity_score DESC;
