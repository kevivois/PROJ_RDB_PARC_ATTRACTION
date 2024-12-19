-- Quelles attractions puis-je faire si j'ai 14 ans et un billet VIP Entry ?
SELECT r.name, r.minimum_age 
FROM ticketTypes AS t
JOIN visitors_rollerCoasters AS v
ON t.id = v.ticket_id
JOIN rollercoasters AS r
ON r.id = v.id
WHERE r.minimum_age <= 14 AND t.name LIKE 'VIP Entry';

-- Quelle est la moyenne des avis ?
SELECT ROUND((AVG(f.rating)), 2) AS "Moyenne des avis" 
FROM feedbacks AS f
JOIN rollercoasters AS r
ON f.rollercoaster_id = r.id;

-- Quelle est la pire attraction (en moyenne) ?
SELECT r.name, ROUND(AVG(f.rating), 2) AS "Moyenne des avis" 
FROM feedbacks AS f
JOIN rollercoasters AS r
ON f.rollercoaster_id = r.id
GROUP BY r.id
ORDER BY "Moyenne des avis" ASC
LIMIT 1;

-- Est-ce que le Park Manager a déjà travaillé à la fois dans un shop (sales_visitors) et dans une attraction ?
SELECT e.firstname, e.lastname 
FROM sales_visitors AS s
JOIN employees AS e
ON s.employee_id = e.id
JOIN employees_rollercoasters AS er
ON e.id = er.employee_id
JOIN roles AS r
ON r.id = e.role_id
WHERE r.role LIKE 'Park Manager';

-- Quels visiteurs ont acheté au moins 2 objets ?
SELECT visitors.id, visitors.firstname || ' ' || visitors.lastname AS visitor, COUNT(sales_visitors.id) 
FROM visitors
INNER JOIN sales_visitors 
ON sales_visitors.visitor_id = visitors.id
GROUP BY visitors.id
HAVING COUNT(sales_visitors.id) >= 2;

-- Combien de produits ont été achetés le 12 décembre ?
SELECT COUNT(s.product_id) 
FROM sales_visitors AS s
WHERE date = '2024-12-12';

-- Quels clients ont acheté quels objets, à quel employé et quand ?
SELECT visitors.firstname || ' ' || visitors.lastname AS client, 
       employees.firstname || ' ' || employees.lastname AS employé, 
       products.product_name AS produit, 
       products.quantity * products.price AS "Prix total", 
       sales_visitors.date AS date 
FROM products
INNER JOIN sales_visitors 
ON sales_visitors.product_id = products.id
INNER JOIN visitors 
ON visitors.id = sales_visitors.visitor_id
INNER JOIN employees 
ON employees.id = sales_visitors.employee_id;


-- Combien de personnes se trouvent dans le parc 14 décembre ?
SELECT COUNT(*) AS TotalPerson FROM (  
SELECT COUNT(*) AS CountValue FROM visitors_tickets AS vt
WHERE vt.date = '2024-12-10'  
UNION ALL   
SELECT COUNT(*) FROM employees_rollercoasters AS er
WHERE er.date = '2024-12-10'   
UNION ALL
SELECT DISTINCT COUNT(*) FROM sales_visitors AS sv
WHERE sv.date = '2024-12-10');

-- Combien de personnes se trouvaient quel jour dans le parc
Select COUNT(visitors.id), visitors_tickets.date
from visitors
join visitors_tickets 
on visitors.id = visitors_tickets.visitor_id
group by visitors_tickets.date
order by count(visitors.id) desc

-- Revenue total du park (sans payer les salaires) ?
SELECT SUM(TotalRevenue) AS TotalRevenues
FROM (
    SELECT SUM(p.price * sv.quantity) AS TotalRevenue
    FROM sales_visitors AS sv
    JOIN products AS p
    ON p.id = sv.product_id
    UNION ALL
    SELECT SUM(tt.price) AS TotalRevenue
    FROM visitors_tickets AS vt
    JOIN ticketTypes AS tt
    ON vt.ticket_id = tt.id
) AS RevenueBreakdown;
