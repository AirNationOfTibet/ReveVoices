CREATE TABLE program (
    id SERIAL PRIMARY KEY,
    name VARCHAR (250) NOT NULL,
    active_program BOOLEAN DEFAULT TRUE,
    description VARCHAR (5000),
    start TIMESTAMP,
    finish TIMESTAMP
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    username VARCHAR (80) UNIQUE NOT NULL,
    password VARCHAR (1000) NOT NULL,
    first VARCHAR (100),
    last VARCHAR (100),
    photo VARCHAR (250),
    email VARCHAR (200),
    instructor BOOLEAN DEFAULT FALSE,
    active_profile BOOLEAN DEFAULT TRUE,
    program_id INT REFERENCES program
);

CREATE TABLE weeks (
    id SERIAL PRIMARY KEY,
    number INT,
    theme VARCHAR (250),
    description VARCHAR (5000),
    program_id INT REFERENCES program,
    current_week BOOLEAN DEFAULT FALSE
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    person_id INT REFERENCES person,
    comment VARCHAR (500),
    date TIMESTAMP,
    week_id INT REFERENCES weeks
);

CREATE TABLE LIKES (
    person_id INT REFERENCES person,
    comment_id INT REFERENCES comments    
);

CREATE TABLE lesson(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    summary VARCHAR(5000),
    week_id INT REFERENCES weeks,
    x INT,
    y INT,
    w INT,
    h INT
);

CREATE TABLE tools_and_activities(
    id SERIAL PRIMARY KEY,
    title VARCHAR (100),
    summary VARCHAR (1000),
    lesson_id INT REFERENCES lesson
);

CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    link VARCHAR (500),
    TA_id INT REFERENCES tools_and_activities
);
