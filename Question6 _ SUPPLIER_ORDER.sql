create PROCEDURE SUPPLIER_ORDER
IS
BEGIN 

Select 

t2.SUPPL_NAME, t3.SUPPL_CONTACT_NAME,
SUBSTR(a.SUPP_CONTACT_NUMBER,1, INSTR(t3.SUPP_CONTACT_NUMBER, '.')-1) AS SUPPL_NUMBER1 , 
SUBSTR(a.SUPP_CONTACT_NUMBER, INSTR(t3.SUPP_CONTACT_NUMBER,',')+1) AS SUPPL_NUMBER2 
regexp_replace(to_char(SUPPL_NUMBER1),((^|, )(('[0-9]{3})([0-9]{3})([0-9]{4})','\1-\2-\3')|'([0-9]{4})([0-9]{3})([0-9]{4})','\1-\2-\3')))+$'),
regexp_replace(to_char(SUPPL_NUMBER2),((^|, )(('[0-9]{3})([0-9]{3})([0-9]{4})','\1-\2-\3')|'([0-9]{4})([0-9]{3})([0-9]{4})','\1-\2-\3')))+$'),
COUNT ((REGEXP_REPLACE(t3.ORDER_REF, '[^0-9A-Za-z ]+', '.'))),
to_char(sum(t2. INV_AMOUNT, '99,999,990.00'))

from SUPPLIER_ORDER  t1

  Inner join tbl_SUPPLIER t2
	on t1.SUPPL_NAME = t2.SUPPL_NAME

  Inner join tbl_SUPPLIER_CONTACT t3
	on t3.SUPPL_NAME = t2.SUPPL_NAME

  Inner join ORDER_DETAILS t4
	on t4.ORDER_REF = t1.ORDER_REF

where t4.ORDER_DATE >= '01-JAN-2017 and t4.ORDER_DATE <= '31-AUG-2017'


end SUPPLIER_ORDER;

