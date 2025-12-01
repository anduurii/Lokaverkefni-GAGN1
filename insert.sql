INSERT INTO users (username, email, date_of_birth, creation_date) VALUES 
('ropzkah', 'ropzkah@gmail.com', '1999-12-22', '2006-07-24'),
('ImperialHal', 'imperialhal@gmail.com', '1999-05-31', '2009-09-14'),
('Zeus', 'choi_wooje@gmail.com', '2004-01-31', '2012-06-03'),
('Faker', 'realfaker@gmail.com', '1996-05-07', '2005-11-19'),
('Nafen', 'nathannn@gmail.com', '2001-10-17', '2008-02-04');


INSERT INTO games (name, release_date, multiplayer, price, crossplay, controller_support, age_restriction, description) VALUES
('Lost Ark', '2002-02-11', TRUE, 0, FALSE, TRUE, 18, 

'Embark on an odyssey for the Lost Ark in a vast, ' || 
'vibrant world: explore new lands, seek out lost treasures, ' || 
'and test yourself in thrilling action combat. ' ||
'Define your fighting style with your class and advanced class, ' || 
'and customize your skills, weapons, ' ||
'and gear to bring your might to bear as you fight against hordes of enemies, colossal bosses, and dark forces ' ||
'seeking the power of the Ark in this action-packed free-to-play RPG.'
),

('NBA 2K26', '2025-09-05', TRUE, 69.99, FALSE, TRUE, 3, 

'Bragging rights are on the line in MyCAREER, MyTEAM, MyNBA, The W, and Play Now. ' ||
'Showcase your bag of moves with hyper realism, Powered by ProPLAY™, ' || 
'and challenge your friends, or rivals, in NBA 2K26’s competitive modes—' ||
'and leave no doubt that you wear the crown.'
),

('Apex Legends', '2020-11-05', TRUE, 0, TRUE, TRUE, 16,

'Apex Legends is the award-winning, ' || 
'free-to-play Hero Shooter from Respawn Entertainment. ' || 
'Master an ever-growing roster of legendary characters with powerful abilities, ' || 
'and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.'
),

('Counter-Strike 2', '2012-08-21', TRUE, 0, FALSE, FALSE, 17, 

'For over two decades, ' ||
'Counter-Strike has offered an elite competitive experience, ' ||
'one shaped by millions of players from across the globe. ' ||
'And now the next chapter in the CS story is about to begin. ' ||
'This is Counter-Strike 2.' 
),

('A Dance of Fire and Ice', '2019-01-25', FALSE, 5.99, FALSE, TRUE, 12,

'A Dance of Fire and Ice is a strict rhythm game. ' ||
'Keep your focus as you guide two orbiting planets ' || 
'along a winding path without breaking their perfect equilibrium.' 
);



INSERT INTO payment_informations
(first_name, last_name, billing_address, card_number, expiration_date, city, postal_code, country, phone_number) 
VALUES
('Robin', 'Kool', '14-3 Kase', '8949143297426743', '06/27', 'Tartu', '50412', 'Estonia', '99452637'),
('Phillip', 'Dosen', '742 Pinecrest Avenue', '0239948052075843', '03/29', 'Denver', '80212', 'United States', '5551942'),
('Lee', 'Sanghyeok', '304-21 Maple-ro', '4293287432984728', '12/26', 'Seoul', '06229', 'South Korea', '1049327815');




INSERT INTO achievements (name, description) VALUES
('The Grind', 'Play the game for more than 1000+ hours'),
-- Lost Ark
('We''re All Buddies!', 'Join a guild'), 
('A Good Trade', 'Buy a Legendary item from the Wandering Merchant'),
('Boss Hunter: Expert', 'Defeat Field Bosses: Black Chicking, White Chicking, Batuark, Gorka Grosse, Savnak, Erasmo'),
-- NBA 2K26
('Championship Material', 'Win the EBA Championship in Out of Bounds in MyCAREER.'),
('Full Potential', 'Earn Hall of Fame on a GOAT Skill in MyCAREER.'),
('Keep Your Distance', 'Make 10 three-point shots in any one game.'),
-- Apex Legends
('Apex Legend', 'Win a game with 8 different Legends'),
('Jumpmaster', 'Be the Jumpmaster 5 times'),
('Kill Leader', 'Become the Kill Leader'),
-- CS2
('A New Beginning', 'This is Counter-Strike, too.'),
-- A Dance of Fire and Ice
('World 12 Perfect', 'Get more than 100% accuracy on World 12'),
('Game 100% Complete', 'Complete 100% of the game'),
('EX Worlds Complete', 'Finish all EX Worlds of Neo Cosmos');


INSERT INTO tags (name) VALUES
('MMORPG'), ('Action'), ('FPS'), ('Shooter'), ('Battle Royale'), 
('Rhythm'), ('Music'), ('Sports'), ('Basketball'),
('Free-To-Play'), ('Multiplayer'), ('Singleplayer');       

INSERT INTO platforms (name) VALUES
('PC'), ('Playstation'), ('Xbox');

INSERT INTO developers (name) VALUES
('Smilegate RPG'), -- Lost Ark
('Visual Concepts'), -- NBA 2K26
('Respawn'), -- Apex Legends 
('Valve'), -- Counter-Strike 2
('7th Beat Games'); -- ADOFAI

