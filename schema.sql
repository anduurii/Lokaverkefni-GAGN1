CREATE DATABASE lokaverkefni

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(30) UNIQUE CHECK (email LIKE '%_@_%._%'),
    date_of_birth DATE NOT NULL,
    creation_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    description TEXT NOT NULL,
    multiplayer BOOLEAN DEFAULT FALSE,
    price DECIMAL(4,2) NOT NULL,
    crossplay BOOLEAN DEFAULT FALSE,
    controller_support BOOLEAN DEFAULT FALSE,
    age_restriction INT NOT NULL
);


CREATE TABLE payment_informations (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    billing_address VARCHAR(255) NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    expiration_date VARCHAR(5) CHECK (expiration_date LIKE '__/__'),
    city VARCHAR(255) NOT NULL,
    postal_code VARCHAR(12) NOT NULL,
    country VARCHAR(255) NOT NULL,
    phone_number VARCHAR(12) NOT NULL
);

CREATE TABLE achievements (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE platforms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

/* Tengi töflur */

CREATE TABLE libraries (
    user_id INT NOT NULL,
    game_id INT,
    playtime INT,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE
);

CREATE TABLE users_achievements (
    user_id INT NOT NULL,
    achievement_id INT,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_achievement
        FOREIGN KEY (achievement_id)
        REFERENCES achievements(id)
        ON DELETE CASCADE
);


CREATE TABLE users_payment_informations (
    user_id INT NOT NULL,
    payment_information_id INT NOT NULL,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_payment_information
        FOREIGN KEY (payment_information_id)
        REFERENCES payment_informations(id)
        ON DELETE CASCADE
);

CREATE TABLE games_tags (
    game_id INT NOT NULL,
    tag_id INT NOT NULL,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_tag
        FOREIGN KEY (tag_id)
        REFERENCES tags(id)
        ON DELETE CASCADE
);

CREATE TABLE games_platforms (
    game_id INT NOT NULL,
    platform_id INT NOT NULL,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_platform
        FOREIGN KEY (platform_id)
        REFERENCES platforms(id)
        ON DELETE CASCADE
);

CREATE TABLE games_achievements (
    game_id INT NOT NULL,
    achievement_id INT NOT NULL,


    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_achievement
        FOREIGN KEY (achievement_id)
        REFERENCES achievements(id)
        ON DELETE CASCADE
);

CREATE TABLE games_developers (
    game_id INT NOT NULL,
    developer_id INT NOT NULL,


    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_developer
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
        ON DELETE CASCADE
);

CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    payment_information_id INT,
    purchase_date DATE DEFAULT CURRENT_DATE,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_payment_information
        FOREIGN KEY (payment_information_id)
        REFERENCES payment_informations(id)
        ON DELETE CASCADE
);