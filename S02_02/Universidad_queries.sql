-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ;
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre, cuatrimestre, curso, id_grado FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT ag.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura am ON  p.id = am.id_alumno
JOIN asignatura ag ON am.id_asignatura = ag.id
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor pr ON d.id = pr.id_departamento
JOIN asignatura a ON pr.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE p.tipo = 'alumno'
  AND ce.anyo_inicio = 2018
  AND ce.anyo_fin = 2019;
  
-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
--
-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT 
    d.nombre AS departamento,
    per.nombre AS nombre_profesor,
    per.apellido1 AS primer_apellido,
    per.apellido2 AS segundo_apellido
FROM  
	profesor pf
JOIN 
	persona per ON pf.id_profesor = per.id
LEFT JOIN 
	departamento d ON  pf.id_profesor = d.id
WHERE 
	tipo = 'profesor'
ORDER BY 
    departamento ASC,
    primer_apellido ASC,
    segundo_apellido ASC,
    nombre_profesor ASC;

-- Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT 
    d.nombre AS departamento,
    per.nombre AS nombre_profesor,
    per.apellido1 AS primer_apellido,
    per.apellido2 AS segundo_apellido
FROM  
	profesor pf
JOIN 
	persona per ON pf.id_profesor = per.id
LEFT JOIN 
	departamento d ON  pf.id_profesor = d.id
WHERE d.id IS NULL
ORDER BY 
    departamento ASC,
    primer_apellido ASC,
    segundo_apellido ASC,
    nombre_profesor ASC;

-- Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT 
    d.nombre AS nom_departament
FROM 
    departamento d
LEFT JOIN 
    profesor p ON d.id = p.id_departamento
WHERE 
    p.id_profesor IS NULL;

-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT
	pf.id_profesor AS ID,
    p.nombre AS NOMBRE
FROM 
	persona p
JOIN
	profesor pf ON p.id = pf.id_profesor
LEFT JOIN
	asignatura a ON pf.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT 
	a.id AS ID_ASIGNATURA,
    a.nombre AS NOMBRE
FROM 
	asignatura a
LEFT JOIN profesor pf ON a.id_profesor = pf.id_profesor
WHERE pf.id_profesor IS NULL;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT 
	d.nombre AS departamento, 
    a.curso AS asignatura
FROM 
	departamento d 
LEFT JOIN
	profesor pf ON d.id = pf.id_departamento 
LEFT JOIN 
	asignatura a ON pf.id_profesor=a.id_profesor
WHERE 
	a.curso IS NULL 
GROUP BY 
	d.nombre, 
    a.curso;

--
-- Consultes resum:
--

-- Retorna el nombre total d'alumnes que hi ha.
	SELECT COUNT(*) AS total_alumnes FROM persona WHERE tipo = 'alumno';
-- Calcula quants alumnes van néixer en 1999.
	SELECT COUNT(*) AS total_alumnes_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
-- El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
	SELECT
		d.nombre AS Nombre_departamento,
		COUNT(p.id_profesor) AS Total_Profesores
	FROM profesor p
    LEFT JOIN 
			departamento d ON p.id_departamento = d.id
	GROUP BY d.nombre
    ORDER BY d.nombre DESC;
        
-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
-- Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
	SELECT 
		d.nombre AS departamentos,
        COUNT(p.id_profesor) AS profesores
	FROM departamento d
    LEFT JOIN
		profesor p ON p.id_departamento = d.id
	GROUP BY d.nombre;
	
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
-- Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. 
-- El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
	
    SELECT 
		g.nombre AS grados,
        COUNT(a.id) AS total_asignatura
	FROM grado g
	LEFT JOIN asignatura a ON a.id_grado = g.id
    GROUP BY g.nombre
    ORDER BY total_asignatura DESC;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

	SELECT 
		g.nombre AS grados,
        COUNT(a.id) AS asignaturas
	FROM grado g
    LEFT JOIN asignatura a ON a.id_grado = g.id
    GROUP BY g.nombre
    HAVING 
		COUNT(a.id) > 40;
    
    
-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
-- El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.

SELECT 
	g.nombre AS grados,
    a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS total_creditos
FROM 
	asignatura a
 JOIN 
	grado g ON a.id_grado =g.id
GROUP BY 
	g.nombre, a.tipo;
    
-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. 
-- El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

SELECT 
	c.anyo_inicio AS inicio_curso,
    COUNT(DISTINCT ma.id_alumno) AS total_matriculados
FROM 
	alumno_se_matricula_asignatura ma
JOIN 
	curso_escolar c ON ma.id_curso_escolar = c.id
GROUP BY 
	c.anyo_inicio
ORDER BY 
	c.anyo_inicio;

-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. 
-- El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. 
-- El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. 
-- El resultat estarà ordenat de major a menor pel nombre d'assignatures.

SELECT 
	p.id AS ID,
	p.nombre AS NOMBRE,
    p.apellido1 AS PRIMER_APELLIDO,
    p.apellido2 AS SEGUNDO_APELLIDO,
    COUNT(a.id) AS TOTAL_ASIGNATURAS
FROM 
	profesor pf
LEFT JOIN persona p ON pf.id_profesor = p.id
LEFT JOIN asignatura a ON a.id_profesor = pf.id_profesor
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY TOTAL_ASIGNATURAS DESC;
    
-- Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY YEAR( fecha_nacimiento) DESC LIMIT 1;

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT pf.id_profesor AS id, CONCAT(per.nombre, ' ', per.apellido1, ' ', per.apellido2) AS instructor, d.nombre AS departmento, a.id AS a 
FROM persona per
JOIN profesor pf ON per.id = pf.id_profesor 
LEFT JOIN asignatura a ON pf.id_profesor = a.id_profesor 
JOIN departamento d ON pf.id_departamento = d.id 
WHERE pf.id_departamento IS NOT NULL AND a.id IS NULL 
ORDER BY d.nombre;
