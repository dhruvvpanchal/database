--find the student who is the most absent
select a.attendance_student_ref, count(a.attendance_presence)
from attendance as a
where a.attendance_presence <> 0
group by a.attendance_student_ref
order by count(a.attendance_presence)
limit 1

--find the course which has the most absent students 
select attendance_course_ref, count(attendance_presence)
from attendance
where attendance_presence <> 0 
group by attendance_course_ref
order by count(attendance_presence)
limit 1

SELECT att.attendance_course_ref, SUM(attendance_presence) FROM attendance att GROUP by att.attendance_course_ref ORDER BY sum desc;

--find the teachers who are not giving any courses
select t.teacher_epita_email, s.session_course_ref  from teachers as t
left join sessions as s
on s.session_prof_ref = t.teacher_epita_email
where s.session_course_ref IS NULL
order by t.teacher_epita_email

--find the students who are not graded
select grade_student_epita_email_ref, grade_score from grades
where grade_score is null

--Count the number of students
select count(*) from students

select a.attendance_presence from attendance as a
select * from courses
--find the student who is the most absent
select a.attendance_student_ref, count(a.attendance_presence)
from attendance as a
where a.attendance_presence <> 0
group by a.attendance_student_ref
order by count(a.attendance_presence)
limit 2

--find the course which has the most absent students 
select attendance_course_ref, count(attendance_presence)
from attendance
where attendance_presence <> 0 
group by attendance_course_ref
order by count(attendance_presence)
limit 1

SELECT att.attendance_course_ref, SUM(attendance_presence) FROM attendance att GROUP by att.attendance_course_ref ORDER BY sum desc;

select contacts.contact_last_name, contacts.contact_first_name, sum (attendance_presence)from attendance
left join students on students.student_epita_email = attendance.attendance_student_ref
left join contacts on contacts.contact_email = students.student_contact_ref
group by contacts.contact_last_name, contacts.contact_first_name
order by sum asc
limit 1;

--find the teachers who are not giving any courses
select t.teacher_epita_email, s.session_course_ref  from teachers as t
left join sessions as s
on s.session_prof_ref = t.teacher_epita_email
where s.session_course_ref IS NULL
order by t.teacher_epita_email

--find the students who are not graded
select grade_student_epita_email_ref, grade_score from grades
where grade_score is null

--Count the number of students
select count(*) from students

--Distribution of students across different programs
select * from students
select * from programs
--distribution of students in percentage
select student_population_code_ref, count(student_epita_email)*100/(select count(*)from students)  from students
group by student_population_code_ref
--distribution w/o percentage
select student_population_code_ref, count(student_epita_email) from students
group by student_population_code_ref

--calculate the average age, average duration of the sessions
select * from sessions

select * from grades
select * from attendance
on courses.col = sessions.col

--Show me grades & attendance for the specific student
select a.attendance_student_ref student, a.attendance_course_ref, sum(a.attendance_presence) attendance, sum(g.grade_score) grades from attendance as a
join grades as g
on a.attendance_student_ref = g.grade_student_epita_email_ref 
and a.attendance_course_ref = g.grade_course_code_ref
group by a.attendance_student_ref, a.attendance_course_ref
order by a.attendance_student_ref;

select attendance_student_ref student, attendance_course_ref, sum(attendance_presence) from attendance
group by attendance_student_ref, attendance_course_ref
order by attendance_student_ref
union
select grade_student_epita_email_ref, grade_course_code_ref, sum(grade_score) from grades
group by grade_student_epita_email_ref, grade_course_code_ref
ORDER BY grade_student_epita_email_ref;

select att.attendance_student_ref, att.attendance_course_ref, attendance, gradescore 
from (select attendance_student_ref, attendance_course_ref, sum(attendance_presence) attendance from attendance
group by attendance_student_ref, attendance_course_ref
order by attendance_student_ref) att
join (select grade_student_epita_email_ref, grade_course_code_ref, sum(grade_score) gradescore from grades
group by grade_student_epita_email_ref, grade_course_code_ref
ORDER BY grade_student_epita_email_ref) grade
on att.attendance_student_ref = grade.grade_student_epita_email_ref 
and att.attendance_course_ref = grade.grade_course_code_ref

--find overlapping between session, provide list of session which are overlapping, based on time rooms like startdate etc
select * from sessions
select count(session_course_ref), session_date, session_start_time from sessions
group by session_start_time, session_date
order by count(session_course_ref) desc

--find the students who are not graded
select count(student_epita_email) from students
select count(distinct grade_student_epita_email_ref) from grades

select s.student_epita_email, g.grade_score from students as s
left join grades as g
on s.student_epita_email = g.grade_student_epita_email_ref
where grade_score is null

--find the course which has the most absent students 
select attendance_course_ref, count(attendance_presence)
from attendance
where attendance_presence <> 0 
group by attendance_course_ref
order by count(attendance_presence)
limit 1

select attendance_course_ref, sum(attendance_presence) presence from attendance
group by attendance_course_ref
order by presence 
limit 1

--find the teachers who are not giving any courses
select t.teacher_epita_email, s.session_course_ref  from teachers as t
left join sessions as s
on s.session_prof_ref = t.teacher_epita_email
where s.session_course_ref IS NULL
order by t.teacher_epita_email

--find the students who are not graded
select grade_student_epita_email_ref, grade_score from grades
where grade_score is null

select grade_student_epita_email_ref, sum(grade_score) grade 
from grades
where grade_score is null
group by grade_student_epita_email_ref
ORDER BY grade;




















