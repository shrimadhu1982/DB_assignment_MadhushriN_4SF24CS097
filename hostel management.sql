PRAGMA foreign_keys = ON;


CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE Student_Phone (
    student_id INTEGER,
    phone_number TEXT,
    PRIMARY KEY (student_id, phone_number),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE Hostel (
    hostel_id INTEGER PRIMARY KEY,
    hostel_name TEXT NOT NULL
);


CREATE TABLE Room (
    room_id INTEGER PRIMARY KEY,
    hostel_id INTEGER,
    capacity INTEGER NOT NULL,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(hostel_id)
);


CREATE TABLE Warden (
    warden_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    hostel_id INTEGER,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(hostel_id)
);

CREATE TABLE Allocation (
    student_id INTEGER,
    room_id INTEGER,
    allocation_date DATE,
    PRIMARY KEY (student_id, room_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);


CREATE TABLE Maintenance_Staff (
    staff_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE Complaint (
    complaint_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    description TEXT,
    status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE Complaint_Assignment (
    complaint_id INTEGER,
    staff_id INTEGER,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (complaint_id, staff_id),
    FOREIGN KEY (complaint_id) REFERENCES Complaint(complaint_id),
    FOREIGN KEY (staff_id) REFERENCES Maintenance_Staff(staff_id)
);

INSERT INTO Students VALUES (1, 'Rahul');
INSERT INTO Students VALUES (2, 'Anita');


INSERT INTO Student_Phone VALUES (1, '9876543210');
INSERT INTO Student_Phone VALUES (1, '9123456780');


INSERT INTO Hostel VALUES (1, 'A Block');


INSERT INTO Room VALUES (101, 1, 3);


INSERT INTO Warden VALUES (1, 'Mr Sharma', 1);


INSERT INTO Allocation VALUES (1, 101, '2024-01-10');
INSERT INTO Allocation VALUES (2, 101, '2024-01-11');


INSERT INTO Maintenance_Staff VALUES (1, 'Ramesh');


INSERT INTO Complaint VALUES (1, 1, 'Fan not working', 'Pending', CURRENT_TIMESTAMP);


INSERT INTO Complaint_Assignment VALUES (1, 1, CURRENT_TIMESTAMP);
