create PROCEDURE ORDER_SUMMARY
IS
BEGIN 

Select 

(REGEXP_REPLACE(t3.ORDER_REF, '[^0-9A-Za-z ]+', '.')),
t3. ORDER_DATE, 
INITCAP(t5. SUPPL_NAME), 
to_char(t3. ORDER_TOTAL_AMOUNT, '99,999,990.00')
t4. ORDER_STATUS,
t2. INV_REF,
to_char(t2. INV_AMOUNT, '99,999,990.00'),
CASE
  WHEN t1. INV_STATUS = 'Paid’ THEN 'OK'
  WHEN t1. INV_STATUS = 'Pending' THEN 'To follow up'
  WHEN t1. INV_STATUS = 'Blank’ THEN 'To verify'
END

from SUPPLIER_INVOICE t1
   Inner join INVOICE t2
      On t1. INV_REF = T2.INV_REF

   Inner join ORDER_DETAILS t3
      On t3.ORDER_REF = t1.ORDER_REF 

   Inner join SUPPLIER_ORDER t4
      On t4.ORDER_REF = t3.ORDER_REF 

   Inner join SUPPLIER t5
      On t5.SUPPL_NAME = t4. SUPPL_NAME

ORDER BY T3.ORDER_DATE DESC
GROUP BY (REGEXP_REPLACE(t3.ORDER_REF, '[^0-9A-Za-z ]+', '.')),t3. ORDER_DATE,INITCAP(t5. SUPPL_NAME)

end ORDER_SUMMARY;

