/* List all users with their games and playtime */

SELECT 
    u.username, 
    g.name AS game, 
    l.playtime
FROM libraries l
JOIN users u ON u.id = l.user_id
JOIN games g ON g.id = l.game_id
ORDER BY g.name, l.playtime DESC;



/*List of users and their total playtime */

SELECT
    u.username,
    SUM(l.playtime) AS total_playtime
FROM users u 
JOIN libraries l ON u.id = l.user_id
GROUP BY u.username
ORDER BY total_playtime DESC;



/* List of all the games with the age restriction below 18 */

SELECT
    g.name AS game,
    g.age_restriction
FROM games g 
WHERE age_restriction < 18
ORDER BY g.age_restriction ASC;



/* List of games with their tags and price */


SELECT
    g.name as game,
    STRING_AGG(t.name, ', ') AS tags,
    g.price as price 
FROM games g
JOIN games_tags gt ON g.id = gt.game_id
JOIN tags t ON t.id = gt.tag_id
GROUP BY g.name, g.price
ORDER BY g.price DESC;



/* Games with the most players */

SELECT 
    g.name AS game,
    COUNT(l.user_id) AS player_count
FROM games g 
JOIN libraries l on g.id = l.game_id
GROUP BY g.name
ORDER BY player_count DESC;



SELECT
    u.username,
    g.name AS game,
    STRING_AGG(a.name, ', ') AS achievement
FROM users_achievements ua  
JOIN users u ON ua.user_id = u.id
JOIN achievements a ON ua.achievement_id = a.id
JOIN games_achievements ga ON a.id = ga.achievement_id
JOIN games g ON ga.game_id = g.id
GROUP BY u.username, g.name;




/* List of users with their saved payment information and those who didn't save */

SELECT 
    u.username,
    pi.card_number,
    pi.expiration_date
FROM users u
LEFT JOIN users_payment_informations upi ON u.id = upi.user_id
LEFT JOIN payment_informations pi ON pi.id = upi.payment_information_id
ORDER BY u.username;
