-- temp table for user input
DROP TABLE if exists CUST;
CREATE TEMPORARY TABLE CUST (
    name VARCHAR(40),
    d_from DATE,
    d_to DATE
);
-- temp table for results
DROP TABLE if exists RES;
CREATE TEMPORARY TABLE RES (
    name VARCHAR(40),
    sum INTEGER
);

-- Find a customer by his name (cust_name) and calculate the total amount
-- of his purchases from the date `date_from` to the date `date_to`.
CREATE OR REPLACE FUNCTION get_user_sum(cust_name customer.name%TYPE,
                                         date_from DATE, date_to DATE)
RETURNS INTEGER
LANGUAGE plpgsql
AS  $function$
DECLARE
    cust_sum INTEGER;
BEGIN
    select sum(price) INTO cust_sum from robot r
    join customer c on c.id_customer = r.id_customer
    where name = cust_name and purchase_date BETWEEN date_from and date_to
    group by c.name;

    RETURN cust_sum;
END;
$function$;


-- main procedure that read, calculate and write to res csv file.
CREATE OR REPLACE PROCEDURE calculate_sum()
as  $$
DECLARE
    curs CURSOR FOR select * from CUST;
    cust_name customer.name%TYPE;
    d_from DATE;
    d_to DATE;
BEGIN
    -- read data in temp table. Must be absolute path
    COPY CUST FROM '/mnt/d/Study_AI/BI-SQL/hw05/customers.csv' DELIMITER ',' CSV HEADER;

    -- using cursor iterate over input data (over temp table CUST)
    OPEN curs;
    LOOP
        FETCH curs INTO cust_name, d_from, d_to;
        EXIT WHEN NOT FOUND;
        INSERT INTO RES(name, sum) VALUES (cust_name,
                    get_user_sum(cust_name, d_from, d_to));
    END LOOP;
    CLOSE curs;

    -- write data from temp table RES to output csv file
    COPY RES TO '/mnt/d/Study_AI/BI-SQL/hw05/res.csv' DELIMITER ',' CSV HEADER;

    -- drop temp tables
    DROP TABLE IF EXISTS RES, CUST;
END;
$$ LANGUAGE plpgsql;

CALL calculate_sum();
