--Quelles attractions puis-je faire si j'ai 14 ans et un billet VIP Entry ?
SELECT r.name, r.minimum_age FROM ticketTypes AS t
JOIN visitors_rollerCoasters AS v
ON t.id = v.ticket_id
JOIN rollercoasters AS r
ON r.id = v.id
WHERE r.minimum_age <= 14 AND t.name LIKE 'VIP Entry';

--Quelles est la moyenne des avis ?
SELECT round((AVG(f.rating)),2) AS "Average ratings" FROM feedbacks AS f
JOIN rollercoasters AS r
ON f.rollercoaster_id = r.id;

--Quelle est la pire attraction (en moyenne) ?
SELECT r.name, round(AVG(f.rating),2) AS "Average ratings" FROM feedbacks AS f
JOIN rollercoasters AS r
ON f.rollercoaster_id = r.id
GROUP BY r.id
ORDER BY "Average ratings" ASC
LIMIT 1;

--Est-ce que le Park Manager à déjà travaillé à la fois dans un shop (sales_visitors) et dans une attractions.
SELECT e.firstname, e.lastname FROM sales_visitors AS s
JOIN employees AS e
ON s.employee_id = e.id
JOIN employees_rollercoasters AS er
ON e.id = er.employee_id
JOIN roles AS r
ON r.id = e.role_id
WHERE r.role LIKE 'Park Manager';

--Quelles visiteurs ont achetés aux moins 2 objets.


--Combien de produits ont été acheté le 12 décembre ?
SELECT COUNT(s.product_id) FROM sales_visitors AS s
GROUP BY s.date
HAVING s.date = '2024-12-01'
ORDER BY COUNT(s.product_id) DESC;


--Quelle employé a vendu un 'objet' à 'client' ?









