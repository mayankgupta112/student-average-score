CREATE DATABASE IF NOT EXISTS student_management;



USE student_management;
SELECT DATABASE();
CREATE TABLE student (
    student_id BIGINT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    programming_score DECIMAL(5,2) NOT NULL,
    mathematics_score DECIMAL(5,2) NOT NULL,
    CHECK (programming_score BETWEEN 0 AND 100),
    CHECK (mathematics_score BETWEEN 0 AND 100)
);

CREATE TABLE student_technical_skills (
    student_id BIGINT,
    technical_skill VARCHAR(100),
    PRIMARY KEY (student_id, technical_skill),
    FOREIGN KEY (student_id)
    REFERENCES student(student_id)
    ON DELETE CASCADE
);
SHOW TABLES;

USE student_management;

-- Insert student records

INSERT INTO student VALUES
(101, 'Mayank', 'mayank@gmail.com', 'B.Tech CS', 85, 90),
(102, 'Rahul', 'rahul@gmail.com', 'B.Tech IT', 75, 80),
(103, 'Aman', 'aman@gmail.com', 'B.Tech CS', 60, 65),
(104, 'Rohit', 'rohit@gmail.com', 'B.Tech IT', 45, 80);


-- Insert technical skills

INSERT INTO student_technical_skills VALUES
(101, 'Java'),
(101, 'Python'),
(101, 'SQL'),

(102, 'Java'),
(102, 'Python'),

(103, 'C++'),
(103, 'Java'),

(104, 'Java'),
(104, 'SQL');
USE student_management;

SELECT
    student_id,
    student_name,
    (programming_score + mathematics_score) / 2
    AS average_score
FROM student;

SELECT
    student_id,
    student_name,

    (programming_score + mathematics_score) / 2
    AS average_score,

    CASE
        WHEN (programming_score + mathematics_score)/2 >= 85
            THEN 'Excellent'

        WHEN (programming_score + mathematics_score)/2 >= 70
            THEN 'Good'

        WHEN (programming_score + mathematics_score)/2 >= 50
            THEN 'Satisfactory'

        ELSE 'Needs Improvement'
    END AS performance_category

FROM student;

SELECT
    student_id,
    student_name,
    programming_score,
    mathematics_score,

    CASE
        WHEN programming_score > mathematics_score
            THEN 'Programming'

        WHEN mathematics_score > programming_score
            THEN 'Mathematics'

        ELSE 'Both Equal'
    END AS stronger_subject
    

FROM student;


SELECT *
FROM student
WHERE student_id = 101
   OR email_address = 'rahul@gmail.com'
   OR course_name = 'B.Tech CS';
SELECT * FROM student
WHERE student_id = 101;

SELECT
    student_id,
    student_name,

    (programming_score + mathematics_score) / 2
    AS average_score

FROM student

ORDER BY average_score DESC;

SELECT
    s1.student_name AS Student_1,
    s2.student_name AS Student_2,
    t1.technical_skill AS Common_Skill

FROM student_technical_skills t1

JOIN student_technical_skills t2
    ON t1.technical_skill = t2.technical_skill

JOIN student s1
    ON t1.student_id = s1.student_id

JOIN student s2
    ON t2.student_id = s2.student_id

WHERE t1.student_id < t2.student_id;

SELECT *
FROM student

WHERE programming_score < 50

AND mathematics_score >= 75;

SHOW CREATE TABLE student;
USE student_management;

SHOW CREATE TABLE student;
SHOW CREATE TABLE student;

USE student_management;

SELECT * FROM student;

SELECT * FROM student_technical_skills;