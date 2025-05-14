
DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;
-- Create Province
CREATE TABLE Province (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Create Locality
CREATE TABLE Locality (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES Province(id)
);

-- Create Client
CREATE TABLE Client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    locality_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (locality_id) REFERENCES Locality(id)
);

-- Create Store
CREATE TABLE Store (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    locality_id INT,
    FOREIGN KEY (locality_id) REFERENCES Locality(id)
);

-- Create Employee
CREATE TABLE Employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    phone VARCHAR(20),
    role ENUM('cook', 'delivery') NOT NULL,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Store(id)
);

-- Create ProductType
CREATE TABLE ProductType (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Create Category
CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Create Product
CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    product_type_id INT NOT NULL,
    category_id INT,
    FOREIGN KEY (product_type_id) REFERENCES ProductType(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Create Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    store_id INT,
    order_datetime DATETIME NOT NULL,
    delivery_type ENUM('home_delivery', 'pickup') NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    delivery_employee_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (store_id) REFERENCES Store(id),
    FOREIGN KEY (delivery_employee_id) REFERENCES Employee(id)
);

-- Create Order_Product (many-to-many relationship)
CREATE TABLE Order_Product (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

--------------------------------------------------------------------------------
-- INSERTS

-- Provinces
INSERT INTO Province (name) VALUES
('Barcelona'), ('Girona'), ('Tarragona'), ('Lleida'), 
('Valencia'), ('Castellón'), ('Alicante'), ('Madrid'), 
('Sevilla'), ('Málaga');

-- Localities
INSERT INTO Locality (name, province_id) VALUES
('Barcelona', 1), ('Badalona', 1), ('Girona', 2), ('Figueres', 2),
('Tarragona', 3), ('Reus', 3), ('Lleida', 4), ('Balaguer', 4),
('Valencia', 5), ('Gandía', 5);

-- Clients
INSERT INTO Client (name, surname, address, postal_code, locality_id, phone) VALUES
('John', 'Doe', '123 Main St', '08001', 1, '123456789'),
('Jane', 'Smith', '456 Elm St', '08002', 2, '987654321'),
('Alice', 'Johnson', '789 Oak St', '17001', 3, '456789123'),
('Bob', 'Williams', '321 Pine St', '17002', 4, '654987321'),
('Charlie', 'Brown', '654 Cedar St', '43001', 5, '789123456'),
('Daisy', 'Miller', '987 Birch St', '43002', 6, '321654987'),
('Eve', 'Davis', '147 Spruce St', '25001', 7, '987321654'),
('Frank', 'Garcia', '258 Fir St', '25002', 8, '123789456'),
('Grace', 'Martinez', '369 Maple St', '46001', 9, '456123789'),
('Hank', 'Rodriguez', '159 Walnut St', '46002', 10, '789456123');

-- Stores
INSERT INTO Store (address, postal_code, locality_id) VALUES
('1 Pizza St', '08001', 1),
('2 Burger Ave', '08002', 2),
('3 Drink Rd', '17001', 3),
('4 Food Blvd', '17002', 4),
('5 Fast Lane', '43001', 5),
('6 Tasty Pl', '43002', 6),
('7 Flavor Dr', '25001', 7),
('8 Crust Way', '25002', 8),
('9 Slice Ct', '46001', 9),
('10 Cheese St', '46002', 10);

-- Employees
INSERT INTO Employee (name, surname, nif, phone, role, store_id) VALUES
('Laura', 'Lopez', '12345678A', '600111222', 'cook', 1),
('Carlos', 'Gomez', '23456789B', '600222333', 'delivery', 1),
('Maria', 'Perez', '34567890C', '600333444', 'cook', 2),
('Luis', 'Sanchez', '45678901D', '600444555', 'delivery', 2),
('Ana', 'Ramirez', '56789012E', '600555666', 'cook', 3),
('Pedro', 'Torres', '67890123F', '600666777', 'delivery', 3),
('Isabel', 'Navarro', '78901234G', '600777888', 'cook', 4),
('Miguel', 'Ramos', '89012345H', '600888999', 'delivery', 4),
('Sara', 'Vega', '90123456I', '600999000', 'cook', 5),
('David', 'Molina', '01234567J', '600000111', 'delivery', 5);

-- ProductType
INSERT INTO ProductType (name) VALUES
('pizza'), ('hamburger'), ('drink');

-- Categories
INSERT INTO Category (name) VALUES
('Summer Specials'), ('Classic'), ('Vegan'), ('Meat Lovers'), ('Seafood'), 
('Cheese Lovers'), ('Spicy'), ('Vegetarian'), ('Kids Menu'), ('Premium');

-- Products
INSERT INTO Product (name, description, image, price, product_type_id, category_id) VALUES
('Margherita', 'Classic pizza with tomato and mozzarella', 'margherita.jpg', 8.99, 1, 2),
('Pepperoni', 'Pizza with pepperoni slices', 'pepperoni.jpg', 9.99, 1, 2),
('Vegan Delight', 'Plant-based pizza', 'vegan.jpg', 10.99, 1, 3),
('BBQ Chicken', 'Pizza with BBQ sauce and chicken', 'bbqchicken.jpg', 11.99, 1, 4),
('Seafood Pizza', 'Shrimp and tuna pizza', 'seafood.jpg', 12.99, 1, 5),
('Cheese Overload', 'Extra cheese pizza', 'cheese.jpg', 9.49, 1, 6),
('Spicy Inferno', 'Super spicy pizza', 'spicy.jpg', 10.49, 1, 7),
('Veggie Lover', 'Lots of vegetables pizza', 'veggie.jpg', 9.49, 1, 8),
('Mini Margherita', 'Small pizza for kids', 'mini_margherita.jpg', 5.99, 1, 9),
('Luxury Truffle', 'Pizza with truffle', 'truffle.jpg', 14.99, 1, 10);

-- Orders
INSERT INTO Orders (client_id, store_id, order_datetime, delivery_type, total_price, delivery_employee_id, delivery_datetime) VALUES
(1, 1, NOW(), 'home_delivery', 25.00, 2, NOW()),
(2, 2, NOW(), 'pickup', 15.00, NULL, NULL),
(3, 3, NOW(), 'home_delivery', 30.00, 4, NOW()),
(4, 4, NOW(), 'pickup', 12.00, NULL, NULL),
(5, 5, NOW(), 'home_delivery', 20.00, 6, NOW()),
(6, 6, NOW(), 'pickup', 18.00, NULL, NULL),
(7, 7, NOW(), 'home_delivery', 22.00, 8, NOW()),
(8, 8, NOW(), 'pickup', 17.00, NULL, NULL),
(9, 9, NOW(), 'home_delivery', 28.00, 10, NOW()),
(10, 10, NOW(), 'pickup', 16.00, NULL, NULL);

-- Order_Product
INSERT INTO Order_Product (order_id, product_id, quantity) VALUES
(1, 1, 2), (1, 2, 1),
(2, 3, 2),
(3, 4, 1), (3, 5, 2),
(4, 6, 1),
(5, 7, 3),
(6, 8, 1),
(7, 9, 2),
(8, 10, 1),
(9, 1, 2),
(10, 2, 1);

