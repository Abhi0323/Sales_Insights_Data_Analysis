
-- Retrieves all records from the "customers" table
SELECT * FROM customers;

-- Retrieves all records from the "date" table
SELECT * FROM date;

-- Retrieves all records from the "markets" table
SELECT * FROM markets;

-- Retrieves all records from the "products" table
SELECT * FROM products;

-- Retrieves all records from the "transactions" table
SELECT * FROM transactions;

-- Counts the number of records in the "customers" table
SELECT COUNT(*) FROM customers;

-- Counts the number of records in the "date" table
SELECT COUNT(*) FROM date;

-- Counts the number of records in the "markets" table
SELECT COUNT(*) FROM markets;

-- Counts the number of records in the "products" table
SELECT COUNT(*) FROM products;

-- Counts the number of records in the "transactions" table
SELECT COUNT(*) FROM transactions;

-- Retrieves all unique values of "customer_type" from the "customers" table
SELECT DISTINCT(customer_type) FROM customers;

-- Counts the number of records in the "customers" table where customer_type is 'E-Commerce'
SELECT COUNT(*) FROM customers WHERE customer_type = 'E-Commerce';

-- Retrieves all unique values of "year" from the "date" table
SELECT DISTINCT(year) FROM date;

-- Retrieves all unique values of "zone" from the "markets" table
SELECT DISTINCT(zone) FROM markets;

-- Retrieves "markets_name" from the "markets" table where zone is 'south'
SELECT markets_name FROM markets WHERE zone = 'south';

-- Retrieves "markets_name" from the "markets" table where zone is 'north'
SELECT markets_name FROM markets WHERE zone = 'north';

-- Retrieves "markets_name" from the "markets" table where zone is 'central'
SELECT markets_name FROM markets WHERE zone = 'central';

-- Retrieves "markets_code" and "zone" from the "markets" table where "markets_name" is 'hyderabad'
SELECT markets_code, zone FROM markets WHERE markets_name = 'hyderabad';

-- Retrieves "markets_code" and "zone" from the "markets" table where "markets_name" is 'mumbai'
SELECT markets_code, zone FROM markets WHERE markets_name = 'mumbai';

-- Counts the number of unique "product_type" values in the "products" table
SELECT COUNT(DISTINCT(product_type)) FROM products;

-- Retrieves all records from the "products" table where "product_type" contains the word 'Own'
SELECT * FROM products WHERE product_type LIKE '%Own%';

-- Retrieves "cost_price" column from the "transactions" table
SELECT cost_price FROM transactions;

-- Retrieves all records from the "transactions" table where "cost_price" is between 1000 and 2000
SELECT * FROM transactions WHERE cost_price BETWEEN 1000 AND 2000;

-- Retrieves "profit_margin", "product_code", and "customer_code" from the "transactions" table where "cost_price" is equal to any of the given values
SELECT profit_margin, product_code, customer_code FROM transactions WHERE cost_price IN (1991.88,1186.5,1480.92);

-- Retrieves all records from the "transactions" table where "market_code" is 'Mark001'
SELECT * FROM transactions WHERE market_code='Mark001';

-- Retrieves all unique "product_code" values from the "transactions" table where "market_code" is 'Mark001'
SELECT DISTINCT product_code FROM transactions WHERE market_code='Mark001';

-- Retrieves all records from the "transactions" table where "currency" is 'USD'
SELECT * FROM transactions WHERE currency="USD";

-- Retrieves the sum of "sales_amount" from the "transactions" table for the year 2020
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020;

-- Retrieves the sum of "sales_amount" from the "transactions" table for December 2019
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2019 AND date.month_name="December";

-- Retrieves the sum of "sales_amount" from the "transactions" table for the year 2020 and market_code is "Mark001"
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND transactions.market_code="Mark001";

-- Retrieves all records from the "transactions" and "customers" tables where the "customer_code" values match
SELECT * FROM transactions AS t JOIN customers AS c ON t.customer_code = c.customer_code;

-- Retrieves order details for transactions with sales quantity greater than 1000, sorted by order date
SELECT order_date, market_code, sales_qty, sales_amount, profit_margin FROM transactions AS t JOIN customers as c ON t.customer_code = c.customer_code
WHERE sales_qty > 1000
ORDER BY order_date;

-- Retrieves all records from the "transactions" table joined with the "date" table on the "order_date" column
SELECT * FROM transactions AS t JOIN date as d ON t.order_date = d.date;

-- Retrieves the maximum profit margin for each month and year combination
SELECT MAX(profit_margin), date.month_name, date.year FROM transactions AS t JOIN date ON t.order_date = date.date
GROUP BY date.month_name, date.year;

-- Retrieves the total sales amount for each month and year combination, ordered by year
SELECT SUM(sales_amount), date.month_name, date.year FROM transactions AS t JOIN date ON t.order_date = date.date
GROUP BY date.month_name, date.year
ORDER BY year;

-- Retrieves the revenue generated by each product in each market
SELECT product_code, market_code, markets_name, SUM(sales_amount) AS Revenue_of_Product FROM transactions t LEFT JOIN markets m ON t.market_code = m.markets_code
GROUP BY product_code, market_code, markets_name
ORDER BY product_code;

-- Retrieves all records from the "transactions", "products", and "markets" tables joined on the respective columns
SELECT * FROM transactions JOIN products ON transactions.product_code = products.product_code
JOIN markets ON transactions.market_code = markets.markets_code;

-- Retrieves order details for transactions with information about the product, customer, market, sales amount, and profit margin, sorted by order date
SELECT transactions.order_date, transactions.product_code, transactions.customer_code, markets.markets_code, transactions.sales_amount, transactions.profit_margin
FROM transactions
JOIN products ON transactions.product_code = products.product_code
JOIN markets ON transactions.market_code = markets.markets_code
ORDER BY order_date;

-- Retrieves all records from the "transactions", "customers", and "date" tables joined on the respective columns
SELECT * FROM transactions Join customers ON (transactions.customer_code = customers.customer_code)
Join date ON transactions.order_date = date.cy_date;