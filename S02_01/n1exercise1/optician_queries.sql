-- Llista el total de factures d'un client/a en un període determinat.
SELECT 
  c.customer_id,
  c.customer_name,
  COUNT(s.sale_id) AS total_factures
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND c.customer_id = 1 
GROUP BY c.customer_id, c.customer_name;


-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT 
  e.employee_id,
  e.employee_name,
  g.glasses_id,
  b.brand_name,
  ft.type_name AS frame_type,
  c.color_name AS frame_color,
  g.price
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
JOIN glasses g ON s.glasses_id = g.glasses_id
JOIN brands b ON g.brand_id = b.brand_id
JOIN frame_types ft ON g.frame_type_id = ft.frame_type_id
JOIN colors c ON g.frame_color_id = c.color_id
WHERE YEAR(s.sale_date) = 2023 -- Substitueix per l'any desitjat
  AND e.employee_id = 1        -- Canvia per l'empleat que t'interessa
GROUP BY g.glasses_id;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT DISTINCT 
  s.supplier_id,
  s.supplier_name
FROM sales sa
JOIN glasses g ON sa.glasses_id = g.glasses_id
JOIN brands b ON g.brand_id = b.brand_id
JOIN suppliers s ON b.supplier_id = s.supplier_id;

