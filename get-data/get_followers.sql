SELECT email, COUNT(*) AS follower_count
FROM users u
JOIN followers f ON u.id = f.following_id
GROUP BY u.id, u.email
ORDER BY follower_count DESC
LIMIT 5;

SELECT *
FROM users u
JOIN profiles p ON p.user_id = u.id AND p.bio IS NOT NULL;
