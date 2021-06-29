DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    preferred_region INT NOT NULL
);

CREATE TABLE categories (
    cat_id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INT REFERENCES users ON DELETE CASCADE,
    location TEXT NOT NULL,
    region_id INT REFERENCES regions ON DELETE CASCADE,
    cat_id INT REFERENCES categories ON DELETE CASCADE
);

-- SELECT * FROM posts p
--     JOIN regions r ON post_id=r.region_id
--     JOIN users u ON post_id=u.user_id
--     JOIN categories c ON post_id=c.cat_id