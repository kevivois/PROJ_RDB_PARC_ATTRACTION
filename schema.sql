CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    role VARCHAR NOT NULL
);

CREATE TABLE ticketTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    price DECIMAL NOT NULL CHECK (price > 0)
);

CREATE TABLE rollerCoasters (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    opening TIME NOT NULL,
    closing TIME NOT NULL,
    minimum_age INT NOT NULL CHECK (minimum_age > 0),
    ticket_required_id INT NOT NULL,
    CONSTRAINT chk_opening_closing CHECK (opening < closing),
    CONSTRAINT fk_rollerCoasters_ticketType FOREIGN KEY (ticket_required_id) REFERENCES ticketTypes (id)
);

CREATE TABLE visitors (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR NOT NULL,
    lastname VARCHAR NOT NULL,
    age INT NOT NULL CHECK (age > 0)
);

CREATE TABLE feedbacks (
    id SERIAL PRIMARY KEY,
    rollerCoaster_id INT NOT NULL,
    visitor_id INT NOT NULL,
    date DATE NOT NULL,
    comment TEXT,
    rating INT NOT NULL CHECK (rating >= 0 AND rating <= 5),
    CONSTRAINT fk_feedbacks_rollerCoaster FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoasters (id),
    CONSTRAINT fk_feedbacks_visitor FOREIGN KEY (visitor_id) REFERENCES visitors (id)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR NOT NULL,
    price DECIMAL NOT NULL CHECK (price > 0),
    quantity INT NOT NULL CHECK (quantity >= 0)
);

CREATE TABLE sales_visitors (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    product_id INT NOT NULL,
    visitor_id INT NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_sales_visitors_employee FOREIGN KEY (employee_id) REFERENCES employees (id),
    CONSTRAINT fk_sales_visitors_product FOREIGN KEY (product_id) REFERENCES products (id),
    CONSTRAINT fk_sales_visitors_visitor FOREIGN KEY (visitor_id) REFERENCES visitors (id)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    firstname VARCHAR NOT NULL,
    lastname VARCHAR NOT NULL,
    salary DECIMAL NOT NULL CHECK (salary > 0),
    CONSTRAINT fk_employees_role FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE visitors_tickets (
    id SERIAL PRIMARY KEY,
    visitor_id INT NOT NULL,
    ticket_id INT NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_visitors_tickets_visitor FOREIGN KEY (visitor_id) REFERENCES visitors (id),
    CONSTRAINT fk_visitors_tickets_ticket FOREIGN KEY (ticket_id) REFERENCES ticketTypes (id)
);

CREATE TABLE visitors_rollerCoasters (
    id SERIAL PRIMARY KEY,
    rollerCoaster_id INT NOT NULL,
    ticket_id INT NOT NULL,
    CONSTRAINT fk_visitors_rollerCoasters_rollerCoaster FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoasters (id),
    CONSTRAINT fk_visitors_rollerCoasters_ticket FOREIGN KEY (ticket_id) REFERENCES ticketTypes (id)
);

CREATE TABLE employees_rollerCoasters (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    rollerCoaster_id INT NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_employees_rollerCoasters_rollerCoaster FOREIGN KEY (rollerCoaster_id) REFERENCES rollerCoasters (id),
    CONSTRAINT fk_employees_rollerCoasters_employee FOREIGN KEY (employee_id) REFERENCES employees (id)
);
