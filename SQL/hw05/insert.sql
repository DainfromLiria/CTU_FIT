-- delete data from tables and reset serial counter
TRUNCATE TABLE ROBOT RESTART IDENTITY CASCADE;
TRUNCATE TABLE CUSTOMER RESTART IDENTITY CASCADE;

-- CUSTOMER
INSERT INTO CUSTOMER (name) VALUES
('John Doe'),
('Jane Smith'),
('Alice Johnson'),
('Bob Brown'),
('Charlie Davis'),
('Diana King'),
('Edward Hall'),
('Fiona Clark'),
('George Miller'),
('Helen Scott');

-- ROBOT
INSERT INTO ROBOT (id_customer, price, model, purchase_date) VALUES
(1, 1500, 'Alpha-1000', '2023-01-15'),
(1, 2500, 'Beta-2000', '2023-02-20'),
(2, 3000, 'Gamma-3000', '2023-03-10'),
(3, 4500, 'Delta-4000', '2023-04-25'),
(4, 2000, 'Epsilon-5000', '2023-05-05'),
(5, 3500, 'Zeta-6000', '2023-06-15'),
(2, 2800, 'Eta-7000', '2023-07-19'),
(3, 3200, 'Theta-8000', '2023-08-23'),
(6, 2200, 'Iota-9000', '2023-09-12'),
(7, 1800, 'Kappa-10000', '2023-10-30'),
(8, 2600, 'Lambda-11000', '2023-11-18'),
(9, 3700, 'Mu-12000', '2023-12-03'),
(10, 4100, 'Nu-13000', '2024-01-25'),
(1, 2900, 'Xi-14000', '2024-02-15'),
(2, 3300, 'Omicron-15000', '2024-03-10'),
(3, 4700, 'Pi-16000', '2024-04-18'),
(4, 5100, 'Rho-17000', '2024-05-05'),
(5, 2300, 'Sigma-18000', '2024-06-14'),
(6, 3900, 'Tau-19000', '2024-07-20'),
(7, 3400, 'Upsilon-20000', '2024-08-29'),
(8, 2700, 'Phi-21000', '2024-09-10'),
(9, 4500, 'Chi-22000', '2024-10-22'),
(10, 4200, 'Psi-23000', '2024-11-15'),
(1, 3100, 'Omega-24000', '2024-12-01');