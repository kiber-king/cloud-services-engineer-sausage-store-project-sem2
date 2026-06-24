CREATE TABLE IF NOT EXISTS order_product (
    id BIGSERIAL PRIMARY KEY,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id BIGINT NOT NULL REFERENCES product(id),
    CONSTRAINT order_product_order_product_unique UNIQUE (order_id, product_id)
);

INSERT INTO order_product (quantity, order_id, product_id)
SELECT quantity, id, product_id
FROM orders
WHERE product_id IS NOT NULL
  AND quantity IS NOT NULL
ON CONFLICT DO NOTHING;

ALTER TABLE orders DROP COLUMN IF EXISTS product_id;
ALTER TABLE orders DROP COLUMN IF EXISTS quantity;
