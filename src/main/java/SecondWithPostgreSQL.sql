CREATE TABLE composers (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           birth_year INT
);

CREATE TABLE musical_works (
                               id SERIAL PRIMARY KEY,
                               title VARCHAR(150) NOT NULL,
                               genre VARCHAR(50),
                               year_composed INT,
                               composer_id INT NOT NULL REFERENCES composers (id)
);

INSERT INTO composers (name, birth_year)
VALUES
    ('Wolfgang Amadeus Mozart', 1756),
    ('Ludwig van Beethoven', 1770);

INSERT INTO musical_works (title, genre, year_composed, composer_id)
VALUES
    ('Symphony No. 40', 'Classical', 1788, 1),
    ('The Magic Flute', 'Opera', 1791, 1),
    ('Symphony No. 9', 'Classical', 1824, 2);

SELECT
    mw.id AS work_id,
    mw.title AS work_title,
    mw.genre AS genre,
    mw.year_composed AS year_composed,
    c.id AS composer_id,
    c.name AS composer_name,
    c.birth_year AS composer_birth_year
FROM musical_works mw LEFT JOIN composers c ON mw.composer_id = c.id;
