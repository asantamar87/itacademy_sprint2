DROP DATABASE IF EXISTS Spotify;
CREATE DATABASE Spotify CHARACTER SET utf8mb4;
USE Spotify;


-- ARTISTS
CREATE TABLE Artist (
    artist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image TEXT
);

-- ALBUMS
CREATE TABLE Album (
    album_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    cover_image TEXT,
    artist_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- SONGS
CREATE TABLE Song (
    song_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME NOT NULL,
    play_count INT DEFAULT 0,
    album_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

-- USERS
CREATE TABLE UserAccount (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    birth_date DATE,
    gender CHAR(1),
    country VARCHAR(50),
    postal_code VARCHAR(10),
    account_type ENUM('free', 'premium') NOT NULL
);

-- USER FOLLOWS ARTISTS
CREATE TABLE User_Follows_Artist (
    user_email VARCHAR(100) NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_email, artist_id),
    FOREIGN KEY (user_email) REFERENCES UserAccount(email),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- PAYMENT METHODS
CREATE TABLE CreditCard (
    card_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(16) NOT NULL,
    expiry_month INT NOT NULL,
    expiry_year INT NOT NULL,
    security_code VARCHAR(4) NOT NULL
);

CREATE TABLE PayPalAccount (
    paypal_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    paypal_username VARCHAR(100) NOT NULL
);

-- SUBSCRIPTIONS
CREATE TABLE Subscription (
    subscription_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    renewal_date DATE,
    payment_method ENUM('credit_card', 'paypal') NOT NULL,
    card_id INT UNSIGNED,
    paypal_id INT UNSIGNED,
    FOREIGN KEY (user_email) REFERENCES UserAccount(email),
    FOREIGN KEY (card_id) REFERENCES CreditCard(card_id),
    FOREIGN KEY (paypal_id) REFERENCES PayPalAccount(paypal_id)
);

-- PAYMENTS
CREATE TABLE Payment (
    order_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    subscription_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);

-- PLAYLISTS
CREATE TABLE Playlist (
    playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    song_count INT DEFAULT 0,
    creation_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    deleted_date DATE,
    owner_email VARCHAR(100) NOT NULL,
    FOREIGN KEY (owner_email) REFERENCES UserAccount(email)
);

-- SHARED PLAYLISTS
CREATE TABLE Shared_Playlist (
    playlist_id INT UNSIGNED NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    PRIMARY KEY (playlist_id, user_email),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (user_email) REFERENCES UserAccount(email)
);

-- SONGS IN PLAYLISTS
CREATE TABLE Playlist_Song (
    playlist_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    added_by VARCHAR(100) NOT NULL,
    added_date DATETIME NOT NULL,
    PRIMARY KEY (playlist_id, song_id, added_by),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id),
    FOREIGN KEY (added_by) REFERENCES UserAccount(email)
);

-- FAVORITE SONGS
CREATE TABLE Favorite_Song (
    user_email VARCHAR(100) NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_email, song_id),
    FOREIGN KEY (user_email) REFERENCES UserAccount(email),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

-- FAVORITE ALBUMS
CREATE TABLE Favorite_Album (
    user_email VARCHAR(100) NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_email, album_id),
    FOREIGN KEY (user_email) REFERENCES UserAccount(email),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);


-- INSERTS

-- Artists
INSERT INTO Artist (name, image) VALUES
('Coldplay', 'coldplay.jpg'),
('Adele', 'adele.jpg'),
('Ed Sheeran', 'edsheeran.jpg'),
('Taylor Swift', 'taylorswift.jpg'),
('Beyonce', 'beyonce.jpg'),
('The Weeknd', 'theweeknd.jpg'),
('Drake', 'drake.jpg'),
('Imagine Dragons', 'imaginedragons.jpg'),
('Billie Eilish', 'billieeilish.jpg'),
('Bruno Mars', 'brunomars.jpg');

-- Albums
INSERT INTO Album (title, release_year, cover_image, artist_id) VALUES
('Parachutes', 2000, 'parachutes.jpg', 1),
('25', 2015, '25.jpg', 2),
('Divide', 2017, 'divide.jpg', 3),
('Reputation', 2017, 'reputation.jpg', 4),
('Lemonade', 2016, 'lemonade.jpg', 5),
('After Hours', 2020, 'afterhours.jpg', 6),
('Scorpion', 2018, 'scorpion.jpg', 7),
('Evolve', 2017, 'evolve.jpg', 8),
('When We All Fall Asleep', 2019, 'wwaf.jpg', 9),
('24K Magic', 2016, '24kmagic.jpg', 10);

-- Songs
INSERT INTO Song (title, duration, play_count, album_id) VALUES
('Yellow', '00:04:26', 5000000, 1),
('Hello', '00:04:55', 7000000, 2),
('Shape of You', '00:03:53', 9000000, 3),
('Look What You Made Me Do', '00:03:31', 6000000, 4),
('Formation', '00:03:26', 4500000, 5),
('Blinding Lights', '00:03:20', 10000000, 6),
('God\'s Plan', '00:03:18', 8000000, 7),
('Believer', '00:03:24', 5500000, 8),
('Bad Guy', '00:03:14', 7500000, 9),
('Uptown Funk', '00:04:30', 6500000, 10);

-- Users
INSERT INTO UserAccount (email, password, username, birth_date, gender, country, postal_code, account_type) VALUES
('alice@example.com', 'pass123', 'alice', '1990-05-14', 'F', 'USA', '10001', 'free'),
('bob@example.com', 'pass456', 'bob', '1985-11-30', 'M', 'Canada', 'M5V', 'premium'),
('carol@example.com', 'pass789', 'carol', '1992-07-21', 'F', 'UK', 'SW1A', 'premium'),
('dave@example.com', 'pass321', 'dave', '1988-01-10', 'M', 'USA', '90210', 'free'),
('eve@example.com', 'pass654', 'eve', '1995-03-05', 'F', 'Australia', '2000', 'premium'),
('frank@example.com', 'pass987', 'frank', '1991-09-17', 'M', 'Germany', '10115', 'free'),
('grace@example.com', 'pass111', 'grace', '1989-12-25', 'F', 'France', '75001', 'premium'),
('heidi@example.com', 'pass222', 'heidi', '1993-04-08', 'F', 'Spain', '28001', 'free'),
('ivan@example.com', 'pass333', 'ivan', '1987-06-14', 'M', 'Russia', '101000', 'premium'),
('judy@example.com', 'pass444', 'judy', '1994-10-22', 'F', 'Italy', '00100', 'free');

-- User follows artist
INSERT INTO User_Follows_Artist (user_email, artist_id) VALUES
('alice@example.com', 1),
('bob@example.com', 2),
('carol@example.com', 3),
('dave@example.com', 4),
('eve@example.com', 5),
('frank@example.com', 6),
('grace@example.com', 7),
('heidi@example.com', 8),
('ivan@example.com', 9),
('judy@example.com', 10);

-- Credit Cards
INSERT INTO CreditCard (card_number, expiry_month, expiry_year, security_code) VALUES
('4111111111111111', 12, 2025, '123'),
('5500000000000004', 11, 2024, '456'),
('340000000000009', 1, 2026, '789'),
('30000000000004', 7, 2023, '321'),
('6011000000000004', 5, 2027, '654'),
('201400000000009', 9, 2023, '987'),
('3530111333300000', 10, 2025, '111'),
('5555555555554444', 6, 2026, '222'),
('4111111111111112', 3, 2024, '333'),
('4222222222222', 8, 2023, '444');

-- PayPal Accounts
INSERT INTO PayPalAccount (paypal_username) VALUES
('alice.paypal'),
('bob.paypal'),
('carol.paypal'),
('dave.paypal'),
('eve.paypal'),
('frank.paypal'),
('grace.paypal'),
('heidi.paypal'),
('ivan.paypal'),
('judy.paypal');

-- Subscriptions
INSERT INTO Subscription (user_email, start_date, renewal_date, payment_method, card_id, paypal_id) VALUES
('bob@example.com', '2024-01-01', '2025-01-01', 'credit_card', 1, NULL),
('carol@example.com', '2023-03-15', '2024-03-15', 'paypal', NULL, 3),
('eve@example.com', '2024-05-10', '2025-05-10', 'credit_card', 2, NULL),
('grace@example.com', '2023-07-20', '2024-07-20', 'paypal', NULL, 7),
('ivan@example.com', '2023-11-11', '2024-11-11', 'credit_card', 4, NULL),
('bob@example.com', '2024-02-01', '2025-02-01', 'paypal', NULL, 2),
('carol@example.com', '2023-04-01', '2024-04-01', 'credit_card', 3, NULL),
('eve@example.com', '2024-06-15', '2025-06-15', 'paypal', NULL, 5),
('grace@example.com', '2023-08-22', '2024-08-22', 'credit_card', 6, NULL),
('ivan@example.com', '2023-12-01', '2024-12-01', 'paypal', NULL, 9);

-- Payments
INSERT INTO Payment (payment_date, total_amount, subscription_id) VALUES
('2024-01-01', 9.99, 1),
('2023-03-15', 9.99, 2),
('2024-05-10', 9.99, 3),
('2023-07-20', 9.99, 4),
('2023-11-11', 9.99, 5),
('2024-02-01', 9.99, 6),
('2023-04-01', 9.99, 7),
('2024-06-15', 9.99, 8),
('2023-08-22', 9.99, 9),
('2023-12-01', 9.99, 10);

-- Playlists
INSERT INTO Playlist (title, song_count, creation_date, is_active, deleted_date, owner_email) VALUES
('Road Trip', 3, '2024-01-01', TRUE, NULL, 'alice@example.com'),
('Workout', 5, '2024-01-05', TRUE, NULL, 'bob@example.com'),
('Chill', 2, '2024-01-10', TRUE, NULL, 'carol@example.com'),
('Party', 6, '2024-02-01', FALSE, '2024-03-01', 'dave@example.com'),
('Focus', 4, '2024-02-10', TRUE, NULL, 'eve@example.com'),
('Sleep', 3, '2024-02-15', TRUE, NULL, 'frank@example.com'),
('Favorites', 7, '2024-03-01', TRUE, NULL, 'grace@example.com'),
('Jazz Vibes', 2, '2024-03-10', TRUE, NULL, 'heidi@example.com'),
('Rock Classics', 5, '2024-03-15', TRUE, NULL, 'ivan@example.com'),
('Pop Hits', 4, '2024-04-01', TRUE, NULL, 'judy@example.com');

-- Shared Playlists (some examples)
INSERT INTO Shared_Playlist (playlist_id, user_email) VALUES
(1, 'bob@example.com'),
(2, 'carol@example.com'),
(3, 'dave@example.com'),
(4, 'eve@example.com'),
(5, 'frank@example.com'),
(6, 'grace@example.com'),
(7, 'heidi@example.com'),
(8, 'ivan@example.com'),
(9, 'judy@example.com'),
(10, 'alice@example.com');

-- Playlist Songs (examples)
INSERT INTO Playlist_Song (playlist_id, song_id, added_by, added_date) VALUES
(1, 1, 'alice@example.com', '2024-01-01 10:00:00'),
(1, 2, 'alice@example.com', '2024-01-01 10:05:00'),
(1, 3, 'alice@example.com', '2024-01-01 10:10:00'),
(2, 4, 'bob@example.com', '2024-01-05 09:00:00'),
(2, 5, 'bob@example.com', '2024-01-05 09:05:00'),
(2, 6, 'bob@example.com', '2024-01-05 09:10:00'),
(2, 7, 'bob@example.com', '2024-01-05 09:15:00'),
(2, 8, 'bob@example.com', '2024-01-05 09:20:00'),
(3, 9, 'carol@example.com', '2024-01-10 08:00:00'),
(3, 10, 'carol@example.com', '2024-01-10 08:05:00');

-- Favorite Songs
INSERT INTO Favorite_Song (user_email, song_id) VALUES
('alice@example.com', 1),
('bob@example.com', 2),
('carol@example.com', 3),
('dave@example.com', 4),
('eve@example.com', 5),
('frank@example.com', 6),
('grace@example.com', 7),
('heidi@example.com', 8),
('ivan@example.com', 9),
('judy@example.com', 10);

-- Favorite Albums
INSERT INTO Favorite_Album (user_email, album_id) VALUES
('alice@example.com', 1),
('bob@example.com', 2),
('carol@example.com', 3),
('dave@example.com', 4),
('eve@example.com', 5),
('frank@example.com', 6),
('grace@example.com', 7),
('heidi@example.com', 8),
('ivan@example.com', 9),
('judy@example.com', 10);
