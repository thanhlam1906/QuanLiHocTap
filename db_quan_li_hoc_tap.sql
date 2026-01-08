create table elearning.Students(
	student_id serial not null primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	stu_email varchar(20) not null unique
);

create table elearning.Instructors(
	instructor_id serial not null primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	teacher_email varchar(20) not null UNIQUE
);

create table elearning.Courses(
	course_id serial not null primary key,
	course_name varchar(100) not null,
	instructor_id int references elearning.instructors(instructor_id) on delete cascade
);

create table elearning.Enrollments(
	enrollment_id serial not null primary key,
	student_id int references elearning.students(student_id) on delete cascade,
	course_id int references elearning.courses(course_id) on delete cascade,
	enroll_date date not null
);

create table elearning.Assignments(
	assignment_id serial not null primary key,
	course_id int references elearning.courses(course_id) on delete cascade,
	title varchar(100) not null,
	due_date date not null,
	start_date date not null default current_date,
	check (due_date > start_date)
);

create table elearning.Submissions(
	submission_id serial not null primary key,
	assignment_id int references elearning.assignments(assignment_id) on delete cascade,
	student_id int references elearning.students(student_id) on delete cascade,
	submission_date date not null,
	grade numeric(5,2) CHECK (grade >= 0 AND grade <= 100)

);