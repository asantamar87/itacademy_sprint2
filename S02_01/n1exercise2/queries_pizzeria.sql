
-- Pizzeria:

   -- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
   SELECT 
    l.name AS locality_name,
    COUNT(op.quantity) AS total_drinks_sold
FROM Order_Product op
JOIN Product p ON op.product_id = p.id
JOIN ProductType pt ON p.product_type_id = pt.id
JOIN Orders o ON op.order_id = o.id
JOIN Store s ON o.store_id = s.id
JOIN Locality l ON s.locality_id = l.id
WHERE pt.name = 'drink' AND l.name = 'Barcelona'
GROUP BY l.name;
  --  Llista quantes comandes ha efectuat un determinat empleat/da.
  
  SELECT 
    e.name, 
    e.surname,
    COUNT(o.id) AS total_orders_delivered
FROM Orders o
JOIN Employee e ON o.delivery_employee_id = e.id
WHERE e.name = 'Carlos' AND e.surname = 'Gomez'
GROUP BY e.id;

