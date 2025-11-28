CREATE DATABASE lokaverkefni

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
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
    expiration_date DATE NOT NULL,
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