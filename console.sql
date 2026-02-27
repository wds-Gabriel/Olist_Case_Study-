CREATE TABLE pedidos (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE avaliacoes (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT, -- TEXT suporta os comentários longos que deram erro
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,
    FOREIGN KEY (order_id) REFERENCES pedidos(order_id)
);



SELECT
    a.review_score as nota_cliente,
    ROUND(AVG(DATEDIFF(p.order_delivered_customer_date, p.order_purchase_timestamp)), 1) AS media_dias_entrega,
    count(p.order_id) AS volume_pedidos
FROM pedidos p
JOIN avaliacoes a on p.order_id = a.order_id
WHERE p.order_delivered_customer_date IS NOT NULL
    AND a.review_score
group by a.review_score
order by a.review_score desc;

