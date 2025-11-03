-- Elearning management system 

CREATE DATABASE ElearningDB;
CREATE SCHEMA elearning;

CREATE TABLE elearning.students(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE elearning.instructors(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE elearning.courses(
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT REFERENCES elearning.instructors(id)
);

CREATE TABLE elearning.enrollments(
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES elearning.students(id),
    course_id INT REFERENCES elearning.courses(id),
    enroll_date DATE NOT NULL
); 

CREATE TABLE elearning.assignments(
    id SERIAL PRIMARY KEY,
    course_id INT REFERENCES elearning.courses(id),
    title VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL
);

CREATE TABLE elearning.submissions(
    id SERIAL PRIMARY KEY,
    assignment_id INT REFERENCES elearning.assignments(id),
    student_id INT REFERENCES elearning.students(id),
    submission_date DATE NOT NULL,
    grade INT CHECK (grade >=0 AND grade <=100)
); 