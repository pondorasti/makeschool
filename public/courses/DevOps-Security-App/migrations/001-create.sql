--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------

CREATE TABLE User (name TEXT, login TEXT, password TEXT);

INSERT INTO User (name, login, password) VALUES ('Cool Admin', 'admin@site.com', 'pass');
INSERT INTO User (name, login, password) VALUES ('Other User', 'user@site.com', 'a$1sB!095$21!');
INSERT INTO User (name, login, password) VALUES ("<script>alert('I hacked the system')</script>", 'login@hacker.com', '133t');

CREATE TABLE Post (title TEXT, body TEXT, claps NUMBER);

INSERT INTO Post (title, body, claps) VALUES ('A post title!', 'This is a post that is <strong>cool</strong>!', 3);

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------

DROP TABLE User;
DROP TABLE Post;
