CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE ticket_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL CHECK (price > 0)
);

CREATE TABLE rollerCoaster (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    opening TIME,
    closing TIME,
    minimum_age INT NOT NULL CHECK (minimum_age > 0),
    ticket_required_id INT NOT NULL,
    CONSTRAINT fk_roller_ticket FOREIGN KEY (ticket_required_id) REFERENCES ticket_type (id)
);

CREATE TABLE visitors (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age > 0)
);

CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    rollerCoaster_id INT NOT NULL,
    visitor_id INT NOT NULL,
    date DATE NOT NULL,
    comments TEXT,
    ratings INT NOT NULL CHECK (ratings >= 0 AND ratings <= 5),
    CONSTRAINT fk_feedback_rollerCoaster FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoaster (id),
    CONSTRAINT fk_feedback_visitor FOREIGN KEY (visitor_id) REFERENCES visitors (id)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL CHECK (price > 0)
);

CREATE TABLE shops (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    id_products INT,
    CONSTRAINT fk_shops_products FOREIGN KEY (id_products) REFERENCES products (id)
);

CREATE TABLE sales_visitors (
    id SERIAL PRIMARY KEY,
    id_products INT NOT NULL,
    id_visitors INT NOT NULL,
    CONSTRAINT fk_sales_productss FOREIGN KEY (id_products) REFERENCES products (id),
    CONSTRAINT fk_sales_visitors FOREIGN KEY (id_visitors) REFERENCES visitors (id)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    salary INT CHECK (salary > 0),
    CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES role (id)
);

CREATE TABLE visitor_tickets (
    id SERIAL PRIMARY KEY,
    visitor_id INT NOT NULL,
    ticket_id INT NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_visitor_tickets_visitor FOREIGN KEY (visitor_id) REFERENCES visitors (id),
    CONSTRAINT fk_visitor_tickets_ticket FOREIGN KEY (ticket_id) REFERENCES ticket_type (id)
);

CREATE TABLE employee_shops (
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    shops_id INT NOT NULL,
    CONSTRAINT fk_employee_shops_employee FOREIGN KEY (employee_id) REFERENCES employee (id),
    CONSTRAINT fk_employee_shops_shops FOREIGN KEY (shops_id) REFERENCES shops (id)
);

CREATE TABLE visitor_rollerCoaster (
    id SERIAL PRIMARY KEY,
    rollerCoaster_id INT NOT NULL,
    ticket_id INT NOT NULL,
    CONSTRAINT fk_visitor_rc_roller FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoaster (id),
    CONSTRAINT fk_visitor_rc_billet FOREIGN KEY (ticket_id) REFERENCES visitors (id)
);

CREATE TABLE employee_rollerCoaster (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    rollerCoaster_id INT NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_employee_rc_roller FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoaster (id),
    CONSTRAINT fk_employee_rc_employee FOREIGN KEY (employee_id) REFERENCES employee (id)
);
