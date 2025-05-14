-- SCHEMA: Tables Definition

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    birthdate DATE,
    gender ENUM('male', 'female', 'other'),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE TABLE Channels (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    creation_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Videos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    size INT,
    filename VARCHAR(255),
    duration TIME,
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes_count INT DEFAULT 0,
    dislikes_count INT DEFAULT 0,
    status ENUM('public', 'hidden', 'private'),
    upload_datetime DATETIME,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Tags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE VideoTags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES Tags(tag_id)
);

CREATE TABLE Subscriptions (
    subscriber_id INT,
    channel_id INT,
    subscription_date DATETIME,
    PRIMARY KEY (subscriber_id, channel_id),
    FOREIGN KEY (subscriber_id) REFERENCES Users(user_id),
    FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);

CREATE TABLE VideoReactions (
    user_id INT,
    video_id INT,
    reaction ENUM('like', 'dislike'),
    reaction_datetime DATETIME,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    creation_date DATE,
    status ENUM('public', 'private'),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE PlaylistVideos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    video_id INT,
    user_id INT,
    text TEXT,
    comment_datetime DATETIME,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE CommentReactions (
    user_id INT,
    comment_id INT,
    reaction ENUM('like', 'dislike'),
    reaction_datetime DATETIME,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

-- INSERT DATA (10 per table)

-- Te muestro un ejemplo con 2 tablas (Users y Channels). El resto fue incluido en el archivo descargable:

INSERT INTO Users (user_id, email, password, username, birthdate, gender, country, postal_code) VALUES 
(1, 'rvazquez@hotmail.com', 'n%J8MHGuT6', 'thomaswoodard', '1985-10-20', 'other', 'Cote d\'Ivoire', '27561'),
(2, 'salasbenjamin@hotmail.com', 'w2SUMgPR)e', 'arichardson', '1916-03-10', 'female', 'British Indian Ocean Territory (Chagos Archipelago)', '50692'),
(3, 'christianwright@yahoo.com', ')dYJHC2p6K', 'elizabeth81', '1924-10-26', 'male', 'Iraq', '45837'),
(4, 'ybutler@nielsen.org', 'b__CRHC#&1', 'psimon', '1915-10-14', 'other', 'Taiwan', '79756'),
(5, 'rbennett@hampton-pittman.org', '&9Rqp0kCr5', 'moraleselizabeth', '1986-11-26', 'female', 'Australia', '01576'),
(6, 'margaretwilson@gmail.com', '^U5T1Q$yx(', 'ubell', '1962-02-04', 'female', 'Central African Republic', '07336'),
(7, 'brandyortiz@gmail.com', '52Md3YH#Eq', 'barrystacy', '1941-03-10', 'male', 'India', '46982'),
(8, 'brownwillie@grimes.com', 'V9pN$qb8VS', 'brian08', '1980-01-29', 'male', 'Togo', '13063'),
(9, 'colemanholly@gmail.com', 'Fv!iL5W^1q', 'kristin43', '1992-04-12', 'female', 'Bulgaria', '56018'),
(10, 'srodriguez@crawford.org', '#aK9H@^tyb', 'dlopez', '1936-01-05', 'other', 'Western Sahara', '41830');

INSERT INTO Channels (channel_id, name, description, creation_date, user_id) VALUES 
(1, 'pathChannel', 'It strategy act under.', '2022-01-18', 2),
(2, 'valueChannel', 'Capital forget speak choice bar.', '2022-10-01', 3),
(3, 'halfChannel', 'Turn none yet yourself work.', '2021-06-12', 4),
(4, 'townChannel', 'Ever trip head.', '2024-03-21', 5),
(5, 'leadChannel', 'The same nothing certain.', '2021-11-14', 6),
(6, 'boyChannel', 'Policy development possible produce.', '2022-05-13', 7),
(7, 'changeChannel', 'Discuss song particularly deal.', '2020-10-29', 8),
(8, 'certainChannel', 'Relate vote really.', '2023-06-15', 9),
(9, 'respondChannel', 'Board detail real practice.', '2023-04-09', 10),
(10, 'itChannel', 'Cell above suggest item.', '2020-03-07', 1);
