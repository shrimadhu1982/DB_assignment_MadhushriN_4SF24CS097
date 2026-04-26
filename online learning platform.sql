PRAGMA foreign_keys = ON;


CREATE TABLE Student (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE Instructor (
    instructor_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE Course (
    course_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    instructor_id INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);


CREATE TABLE Module (
    module_id INTEGER PRIMARY KEY,
    course_id INTEGER,
    title TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


CREATE TABLE Lesson (
    lesson_id INTEGER PRIMARY KEY,
    module_id INTEGER,
    title TEXT NOT NULL,
    FOREIGN KEY (module_id) REFERENCES Module(module_id)
);


CREATE TABLE Enrollment (
    student_id INTEGER,
    course_id INTEGER,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


CREATE TABLE Progress (
    student_id INTEGER,
    lesson_id INTEGER,
    status TEXT CHECK(status IN ('Not Started','In Progress','Completed')),
    PRIMARY KEY (student_id, lesson_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson(lesson_id)
);


CREATE TABLE Tag (
    tag_id INTEGER PRIMARY KEY,
    tag_name TEXT NOT NULL UNIQUE
);


CREATE TABLE CourseTag (
    course_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (course_id, tag_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);


CREATE TABLE Review (
    review_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student VALUES (1, 'Anita');
INSERT INTO Student VALUES (2, 'Rahul');
INSERT INTO Student VALUES (3, 'Kiran');
INSERT INTO Student VALUES (4, 'Sneha');
INSERT INTO Student VALUES (5, 'Arjun');
INSERT INTO Student VALUES (6, 'Meena');
INSERT INTO Student VALUES (7, 'Vikram');
INSERT INTO Student VALUES (8, 'Pooja');
INSERT INTO Student VALUES (9, 'Ravi');
INSERT INTO Student VALUES (10, 'Neha');


INSERT INTO Instructor VALUES (1, 'Dr Rao');
INSERT INTO Instructor VALUES (2, 'Dr Sharma');
INSERT INTO Instructor VALUES (3, 'Prof Mehta');


INSERT INTO Course VALUES (1, 'DBMS', 1);
INSERT INTO Course VALUES (2, 'Operating Systems', 2);
INSERT INTO Course VALUES (3, 'Data Structures', 3);


INSERT INTO Module VALUES (1, 1, 'Basics of DBMS');
INSERT INTO Module VALUES (2, 1, 'SQL');
INSERT INTO Module VALUES (3, 2, 'Process Management');
INSERT INTO Module VALUES (4, 3, 'Arrays and Linked Lists');


INSERT INTO Lesson VALUES (1, 1, 'Introduction to DBMS');
INSERT INTO Lesson VALUES (2, 1, 'ER Model');
INSERT INTO Lesson VALUES (3, 2, 'SQL Queries');
INSERT INTO Lesson VALUES (4, 3, 'Scheduling');
INSERT INTO Lesson VALUES (5, 4, 'Arrays');


INSERT INTO Enrollment VALUES (1, 1, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (2, 1, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (3, 2, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (4, 3, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (5, 1, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (6, 2, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (7, 3, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (8, 1, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (9, 2, CURRENT_TIMESTAMP);
INSERT INTO Enrollment VALUES (10, 3, CURRENT_TIMESTAMP);


INSERT INTO Progress VALUES (1, 1, 'Completed');
INSERT INTO Progress VALUES (1, 2, 'In Progress');
INSERT INTO Progress VALUES (2, 1, 'Completed');
INSERT INTO Progress VALUES (3, 3, 'Completed');
INSERT INTO Progress VALUES (4, 4, 'In Progress');
INSERT INTO Progress VALUES (5, 1, 'Not Started');
INSERT INTO Progress VALUES (6, 4, 'Completed');
INSERT INTO Progress VALUES (7, 5, 'Completed');
INSERT INTO Progress VALUES (8, 2, 'Completed');
INSERT INTO Progress VALUES (9, 3, 'In Progress');


INSERT INTO Tag VALUES (1, 'Database');
INSERT INTO Tag VALUES (2, 'Systems');
INSERT INTO Tag VALUES (3, 'Programming');


INSERT INTO CourseTag VALUES (1, 1);
INSERT INTO CourseTag VALUES (2, 2);
INSERT INTO CourseTag VALUES (3, 3);
INSERT INTO CourseTag VALUES (1, 3);
INSERT INTO CourseTag VALUES (2, 3);


INSERT INTO Review VALUES (1, 1, 1, 5, 'Excellent course', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (2, 2, 1, 4, 'Very good', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (3, 3, 2, 3, 'Average', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (4, 4, 3, 5, 'Loved it', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (5, 5, 1, 4, 'Good content', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (6, 6, 2, 5, 'Well explained', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (7, 7, 3, 4, 'Nice examples', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (8, 8, 1, 3, 'Okay', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (9, 9, 2, 4, 'Useful', CURRENT_TIMESTAMP);
INSERT INTO Review VALUES (10, 10, 3, 5, 'Great course', CURRENT_TIMESTAMP);
