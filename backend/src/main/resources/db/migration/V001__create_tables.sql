CREATE TABLE IF NOT EXISTS product (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    picture_url TEXT NOT NULL,
    price NUMERIC(19, 2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS orders (
    id BIGSERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    date_created DATE NOT NULL DEFAULT CURRENT_DATE,
    product_id BIGINT,
    quantity INTEGER
);
