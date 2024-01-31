-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM students
WHERE Year(date_of_birth) = 1990;


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT* 
FROM courses
WHERE cfu >10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM students
WHERE Year(date_of_birth) < 1994;


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM courses
WHERE period = 'I semestre' AND year = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)


-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT*
FROM degrees
WHERE level = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) as Numero_dip
FROM departments;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) as num_teach_NoPhone
FROM teachers
WHERE phone IS NULL;