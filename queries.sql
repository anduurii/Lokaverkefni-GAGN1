/* 1. Users with their games and playtime */

SELECT 
    u.username, 
    g.name AS game, 
    l.playtime
FROM libraries l
JOIN users u ON u.id = l.user_id
JOIN games g ON g.id = l.game_id
ORDER BY g.name, l.playtime DESC;



/* 2. Users and their total playtime */

SELECT
    u.username,
    SUM(l.playtime) AS total_playtime
FROM users u 
JOIN libraries l ON u.id = l.user_id
GROUP BY u.username
ORDER BY total_playtime DESC;



/* 3. Games with the age restriction < 18 */

SELECT
    g.name AS game,
    g.age_restriction
FROM games g 
WHERE age_restriction < 18
ORDER BY g.age_restriction ASC;



/* 4. Games with their tags and price */


SELECT
    g.name as game,
    STRING_AGG(t.name, ', ') AS tags,
    g.price as price 
FROM games g
JOIN games_tags gt ON g.id = gt.game_id
JOIN tags t ON t.id = gt.tag_id
GROUP BY g.name, g.price
ORDER BY g.price DESC;



/* 5. Games with the most players */

SELECT 
    g.name AS game,
    COUNT(l.user_id) AS player_count
FROM games g 
JOIN libraries l on g.id = l.game_id
GROUP BY g.name
ORDER BY player_count DESC;

/* 6. Users and achievements for games they own */

SELECT
    u.username,
    g.name AS game,
    STRING_AGG(a.name, ', ') AS achievements
FROM users u 
JOIN libraries l ON u.id = l.user_id
JOIN games g ON g.id = l.game_id
JOIN games_achievements ga ON g.id = ga.game_id
JOIN achievements a ON ga.achievement_id = a.id
JOIN users_achievements ua ON ua.user_id = u.id AND ua.achievement_id = a.id
GROUP BY u.username, g.name
ORDER BY u.username, g.name;


/* 7. List of users who own more than 3 games */

SELECT 
    u.username,
    COUNT(l.game_id) AS game_count
FROM users u
JOIN libraries l ON u.id = l.user_id
GROUP BY u.username
HAVING COUNT(l.game_id) > 3;


/* 8. Developers and their games */

SELECT
    d.name AS developer,
    STRING_AGG(g.name, ', ') AS games
FROM developers
JOIN games_developers gd ON d.id = gd.developer_id
JOIN games g ON g.id = gd.game_id
GROUP BY d.name;

/* 9. Tags used by at least 2 different games */

SELECT
    t.name as tag,
    COUNT(gt.game_id) AS used_in_games
FROM tags t 
JOIN games_tags gt ON t.id = gt.tag_id
GROUP BY t.name
HAVING COUNT(gt.game_id) >= 2
ORDER BY used_in_games DESC;


/* 10. Games and the platforms they support */

SELECT 
    g.name as game,
    STRING_AGG (p.name, ', ') AS platforms
FROM games g
JOIN games_platforms gp ON g.id = gp.game_id
JOIN platforms p ON p.id = gp.platform_id
GROUP BY g.name
ORDER BY g.name;

/* 11. LEFT JOIN List of users with their saved payment information and those who didn't save */

SELECT 
    u.username,
    pi.card_number,
    pi.expiration_date
FROM users u
LEFT JOIN users_payment_informations upi ON u.id = upi.user_id
LEFT JOIN payment_informations pi ON pi.id = upi.payment_information_id
ORDER BY u.username;


/* 12. LEFT JOIN Achievements and users who unlocked them */

SELECT
    a.name AS achievement,
    STRING_AGG(u.username, ', ') AS users
FROM achievements a
LEFT JOIN users_achievements ua ON a.id = ua.achievement_id
LEFT JOIN users u ON u.id = ua.user_id
GROUP BY a.name
ORDER BY a.name;


/* 13. CTE Top 3 most played games by total playtime */

WITH playtotals AS (
    SELECT
        g.name,
        SUM(l.playtime) AS total_playtime
    FROM games g
    JOIN libraries l ON g.id = l.game_id
    GROUP BY g.name
)
SELECT *
FROM playtotals
ORDER BY total_playtime DESC
LIMIT 3;


/* 14. CTE Most played genre (tag) based on total playtime */

WITH tag_playtime AS (
    SELECT
        t.name as tag,
        SUM(l.playtime) AS total_playtime
    FROM tags t
    JOIN games_tags gt ON t.id = gt.tag_id
    JOIN games g ON g.id = gt.game_id
    JOIN libraries l ON g.id = l.game_id
    GROUP BY t.name
)
SELECT *
FROM tag_playtime
ORDER BY total_playtime DESC
LIMIT 1;


/* SUBQUERY Most expensive game */

SELECT
    name,
    price
FROM games
WHERE price = (SELECT MAX(price) FROM games);



/* Index to find all users for a specific achievement */

CREATE INDEX idx_users_achievements_achievement_user
ON users_achievements (achievement_id, user_id);


/* Index to find all games owned by a specific user */

CREATE INDEX idx_libraries_user
ON libraries (user_id);

/* Index to find all games for a specific tag */

CREATE INDEX idx_games_tags_tag
ON games_tags (tag_id);



/* View user_game_playtime */

CREATE VIEW user_game_playtime AS
SELECT
    u.username,
    g.name AS game,
    l.playtime
FROM users u
JOIN libraries l ON u.id = l.user_id
JOIN games g ON g.id = l.game_id;


/* View game_tag_summary */

CREATE VIEW game_tag_summary AS
SELECT
    g.name AS game,
    STRING_AGG(t.name, ', ') AS tags
FROM games g
JOIN games_tags gt ON g.id = gt.game_id
JOIN tags t ON t.id = gt.tag_id
GROUP BY g.name;


/* View user_achievement_summary */

CREATE VIEW user_achievement_summary AS
SELECT
    u.username,
    STRING_AGG(a.name, ', ') AS achievements
FROM users u
LEFT JOIN users_achievements ua ON u.id = ua.user_id
LEFT JOIN achievements a ON a.id = ua.achievement_id
GROUP BY u.username;