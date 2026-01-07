USE PRACTICE;

CREATE TABLE Product (
    ID INT,
    Product VARCHAR(50),
    Quantity INT,
    Color VARCHAR(50)
);

INSERT INTO Product (ID, Product, Quantity, Color) VALUES
(1, 'apple', 20, 'red'),
(2, 'orange', 15, 'orange'),
(3, 'apple', 20, 'red'),
(4, 'banana', 35, 'yellow'),
(5, 'banana', 36, 'yellow'),
(6, 'grape', 25, 'green'),
(7, 'pineapple', 40, 'brown'),
(8, 'pineapple', 70, 'brown');

commit;

-------------------------------------------------------------------------------------------------------------------------------------------------------

#SQL QUERIES

#QUES_1 : How to get unique product from the table without using distinct keywords.
SELECT Product
FROM Product
GROUP BY Product;

#QUES_2 : How to get only duplcate prodcut  
SELECT Product
FROM Product
GROUP BY PRODUCT
HAVING COUNT(*)>1;

#QUES_3 : How to get the sum of quantities sold for each product.
SELECT PRODUCT, SUM(QUANTITY)
FROM PRODUCT
GROUP BY PRODUCT;

#QUES_4 : How to get the product and their respective count
SELECT PRODUCT, COUNT(PRODUCT)
FROM PRODUCT
GROUP BY PRODUCT;

#QUES_5 : How do you delete duplicate product
DELETE Q FROM 
PRODUCT P, PRODUCT Q
WHERE P.ID<Q.ID
AND P.PRODUCT=Q.PRODUCT;
