/* List all users with their games and playtime, ordered by username */

SELECT 
    u.username, 
    g.name AS game_name, 
    l.playtime
FROM libraries l
JOIN users u ON u.id = l.user_id
JOIN games g ON g.id = l.game_id
ORDER BY u.username;

