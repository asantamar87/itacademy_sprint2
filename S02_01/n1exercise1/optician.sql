-- Eliminar base de datos previa
DROP DATABASE IF EXISTS prueba;

-- Crear nueva base de datos
CREATE DATABASE prueba CHARACTER SET utf8mb4;
USE prueba;

-- ========================
-- TABLAS
-- ========================

CREATE TABLE countries (
  country_id INT PRIMARY KEY AUTO_INCREMENT,
  country_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE cities (
  city_id INT PRIMARY KEY AUTO_INCREMENT,
  city_name VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10),
  country_id INT NOT NULL,
  FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE addresses (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  street VARCHAR(100) NOT NULL,
  number VARCHAR(10),
  floor VARCHAR(10),
  door VARCHAR(10),
  city_id INT NOT NULL,
  FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY AUTO_INCREMENT,
  supplier_name VARCHAR(100) NOT NULL,
  address_id INT NOT NULL,
  phone VARCHAR(20),
  fax VARCHAR(20),
  tax_id VARCHAR(20) UNIQUE NOT NULL,
  FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE frame_types (
  frame_type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name ENUM('floating','plastic','metal') UNIQUE NOT NULL
);

CREATE TABLE colors (
  color_id INT PRIMARY KEY AUTO_INCREMENT,
  color_name VARCHAR(30) UNIQUE NOT NULL,
  hex_code VARCHAR(7)
);

CREATE TABLE brands (
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  brand_name VARCHAR(50) UNIQUE NOT NULL,
  supplier_id INT NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE glasses (
  glasses_id INT PRIMARY KEY AUTO_INCREMENT,
  brand_id INT NOT NULL,
  frame_type_id INT NOT NULL,
  frame_color_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
  FOREIGN KEY (frame_type_id) REFERENCES frame_types(frame_type_id),
  FOREIGN KEY (frame_color_id) REFERENCES colors(color_id)
);

CREATE TABLE glass_colors (
  glasses_id INT NOT NULL,
  color_id INT NOT NULL,
  side ENUM('left','right') NOT NULL,
  prescription DECIMAL(4,2),
  PRIMARY KEY (glasses_id, side),
  FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id) ON DELETE CASCADE,
  FOREIGN KEY (color_id) REFERENCES colors(color_id)
);

CREATE TABLE positions (
  position_id INT PRIMARY KEY AUTO_INCREMENT,
  position_name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_name VARCHAR(100) NOT NULL,
  position_id INT NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(100) NOT NULL,
  address_id INT NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100) UNIQUE,
  registration_date DATE NOT NULL,
  referred_by INT,
  FOREIGN KEY (address_id) REFERENCES addresses(address_id),
  FOREIGN KEY (referred_by) REFERENCES customers(customer_id)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY AUTO_INCREMENT,
  glasses_id INT NOT NULL,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  sale_date DATETIME NOT NULL,
  sale_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ========================
-- INSERTS (5 por tabla)
-- ========================

-- countries
INSERT INTO countries (country_name) VALUES 
('Spain'), ('France'), ('Germany'), ('Italy'), ('Portugal');

-- cities
INSERT INTO cities (city_name, postal_code, country_id) VALUES
('Madrid', '28001', 1),
('Barcelona', '08001', 1),
('Paris', '75001', 2),
('Berlin', '10115', 3),
('Lisbon', '1100-001', 5);

-- addresses
INSERT INTO addresses (street, number, floor, door, city_id) VALUES
('Gran Vía', '1', '1', 'A', 1),
('Diagonal', '10', '2', 'B', 2),
('Champs Elysees', '100', NULL, NULL, 3),
('Unter den Linden', '20', '3', 'C', 4),
('Rua Augusta', '55', '1', 'D', 5);

-- suppliers
INSERT INTO suppliers (supplier_name, address_id, phone, fax, tax_id) VALUES
('VisionCorp', 1, '600000001', '600000002', 'A11111111'),
('OptiFrance', 3, '600000003', '600000004', 'B22222222'),
('BerlinOptik', 4, '600000005', '600000006', 'C33333333'),
('LisbonVision', 5, '600000007', '600000008', 'D44444444'),
('OpticaEspaña', 2, '600000009', '600000010', 'E55555555');

-- frame_types
INSERT INTO frame_types (type_name) VALUES 
('floating'), ('plastic'), ('metal');

-- colors
INSERT INTO colors (color_name, hex_code) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Green', '#00FF00');

-- brands
INSERT INTO brands (brand_name, supplier_id) VALUES
('RayBan', 1),
('Oakley', 2),
('Gucci', 3),
('Armani', 4),
('Mango', 5);

-- glasses
INSERT INTO glasses (brand_id, frame_type_id, frame_color_id, price) VALUES
(1, 1, 1, 99.99),
(2, 2, 2, 149.99),
(3, 3, 3, 199.99),
(4, 1, 4, 129.99),
(5, 2, 5, 89.99);

-- glass_colors (1 par de colores por gafas)
INSERT INTO glass_colors (glasses_id, color_id, side, prescription) VALUES
(1, 1, 'left', 1.25),
(1, 1, 'right', 1.50),
(2, 2, 'left', 0.75),
(2, 2, 'right', 0.75),
(3, 3, 'left', 2.00);

-- positions
INSERT INTO positions (position_name, description) VALUES
('Optometrist', 'Eye specialist'),
('Sales Assistant', 'Customer service'),
('Manager', 'Oversees the business'),
('Technician', 'Fixes and assembles glasses'),
('Receptionist', 'Handles appointments');

-- employees
INSERT INTO employees (employee_name, position_id, hire_date) VALUES
('Laura Pérez', 1, '2021-01-01'),
('Carlos Ruiz', 2, '2021-02-01'),
('Ana Gómez', 3, '2021-03-01'),
('Sofía Torres', 4, '2021-04-01'),
('David Martín', 5, '2021-05-01');

-- customers
INSERT INTO customers (customer_name, address_id, phone, email, registration_date, referred_by) VALUES
('Pedro López', 1, '610000001', 'pedro@example.com', '2022-01-01', NULL),
('Lucía Martín', 2, '610000002', 'lucia@example.com', '2022-02-01', 1),
('Daniela Ramos', 3, '610000003', 'daniela@example.com', '2022-03-01', 1),
('Sergio Díaz', 4, '610000004', 'sergio@example.com', '2022-04-01', 2),
('Natalia Romero', 5, '610000005', 'natalia@example.com', '2022-05-01', NULL);

-- sales
INSERT INTO sales (glasses_id, customer_id, employee_id, sale_date, sale_price) VALUES
(1, 1, 1, '2023-01-01 10:00:00', 99.99),
(2, 2, 2, '2023-01-02 11:00:00', 149.99),
(3, 3, 3, '2023-01-03 12:00:00', 199.99),
(4, 4, 4, '2023-01-04 13:00:00', 129.99),
(5, 5, 5, '2023-01-05 14:00:00', 89.99);
