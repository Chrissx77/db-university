-- ## Repo
-- `db-university`

-- ## DB
-- [[Database/2024-01-31 - DB University|DB University]]

-- ## Todo
-- Dopo aver testato le vostre query con `phpMyAdmin`, riportatele in un file `txt` o `md` e caricatelo nella vostra repo.

-- ### Query
-- #### Group by
-- 1. Contare quanti iscritti ci sono stati ogni anno
-- ```sql
SELECT YEAR(students.enrolment_date) as anno, COUNT(*) as num_iscritti_anno
FROM students
GROUP BY YEAR(students.enrolment_date);

-- ```

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- ```sql
SELECT office_address,  COUNT(*) as num_teach
FROM teachers
GROUP BY office_address;

-- ```

-- 3. Calcolare la media dei voti di ogni appello d'esame (dell'esame vogliamo solo l'`id`)
-- ```sql
SELECT FLOOR(AVG(vote)) as media_voto
FROM exam_student
GROUP BY exam_id;

-- ```

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
-- ```sql
SELECT COUNT(*) as num_cors
FROM degrees
GROUP BY department_id;

-- ```


-- #### Join
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- ```sql
SELECT students.id as id, students.name as name, degrees.name as corsi
FROM degrees JOIN students ON degrees.id = students.degree_id
WHERE degrees.name LIKE 'Corso di Laurea in Economia';

-- ```

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
-- ```sql
SELECT*
FROM degrees JOIN departments ON degrees.department_id = departments.id
WHERE level LIKE 'magistrale'
    AND departments.name LIKE 'Dipartimento di Neuroscienze';

-- ```

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
-- ```sql
SELECT teachers.name, courses.name
FROM teachers, courses, course_teacher
WHERE teachers.id = 44
    AND teachers.id = course_teacher.teacher_id
    AND course_teacher.course_id = courses.id;
-- ```

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
-- ```sql
SELECT students.name, students.surname, degrees.*
FROM students,degrees
WHERE students.degree_id = degrees.id
ORDER BY students.surname;
-- ```

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
-- ```sql
SELECT degrees.name, courses.name as name_corso, teachers.name as name_teach, teachers.surname as surname_teach
FROM degrees, courses, course_teacher,teachers
WHERE degrees.id = courses.degree_id
    AND courses.id = course_teacher.course_id
    AND teachers.id = course_teacher.teacher_id
    ORDER BY degrees.name;

-- ```

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- ```sql
SELECT teachers.*, degrees.name as corso_laurea
FROM teachers, course_teacher,courses, degrees
WHERE teachers.id = course_teacher.teacher_id 
AND course_teacher.course_id = courses.id
AND courses.degree_id = degrees.id
AND degrees.name LIKE 'Corso di Laurea in Matematica';

-- ```


-- ##### Bonus
-- 7. Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.
-- ```sql
SELECT students.id, COUNT(*) as num_esami_sostenuti, MAX(vote) as voto_massimo
FROM students, exam_student
WHERE students.id = exam_student.exam_id
AND exam_student.vote >= 18
GROUP BY students.id;

-- ```