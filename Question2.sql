CREATE TABLE tbl_SUPPLIER (
 SUPPL_NAME 	        VARCHAR2(2000) NOT NULL, 
 SUPPL_ADDRESS 		VARCHAR2(2000) NOT NULL, 
 SUPPL_EMAIL 	        VARCHAR2(2000) NOT NULL,
 PRIMARY KEY(SUPPL_NAME)

);

CREATE TABLE tbl_SUPPLIER_CONTACT (
 SUPPL_NAME 	        VARCHAR2(2000) NOT NULL, 
 SUPPL_CONTACT_NAME 	VARCHAR2(2000) NOT NULL, 
 SUPPL_CONTACT_NUMBER	VARCHAR2(2000) NOT NULL,
 PRIMARY KEY(SUPPL_NAME)

);

CREATE TABLE tbl_ORDER_DETAILS (
 ORDER_REF 	        VARCHAR2(2000) NOT NULL,
 ORDER_DATE 		DATE NULL,
 ORDER_TOTAL_AMOUNT 	NUMBER(15), 
 ORDER_DESCRIPTION      VARCHAR2(2000) NOT NULL,  
 ORDER_LINE_AMOUNT 	NUMBER(15),
 PRIMARY KEY(ORDER_REF)
);
  
 
CREATE TABLE tbl_SUPPLIER_ORDER (
 ORDER_REF 	        VARCHAR2(2000) NOT NULL, 
 SUPPL_NAME 	        VARCHAR2(2000) NOT NULL,
 ORDR_STATUS 		VARCHAR2(2000) NOT NULL
 
 PRIMARY KEY(ORDER_REF)
 CONSTRAINT FK_SupplierName FOREIGN KEY (SUPPL_NAME)
 REFERENCES tbl_SUPPLIER(SUPPL_NAME),

 CONSTRAINT FK_SupplierRef FOREIGN KEY (ORDER_REF)
 REFERENCES tbl_ORDER_DETAILS(ORDER_REF)

);


CREATE TABLE tbl_INVOICE (
 INV_REF  	        NUMBER(38) NOT NULL, 
 INV_DATE 		DATE,  
 INV_HOLD_REASON        VARCHAR2(2000), 
 INV_AMOUNT 		NUMBER(15), 
 INV_DESCRIPTION        VARCHAR2(2000),
 PRIMARY KEY(INV_REF)

);

CREATE TABLE tbl_SUPPLIER_INVOICE (
 INV_REF  	        NUMBER(38) NOT NULL, 
 ORDER_REF 	        VARCHAR2(2000) NOT NULL, 
 INV_STATUS 		VARCHAR2(2000)
 
 PRIMARY KEY(INV_REF)
 CONSTRAINT FK_SupplierInvoiceRef FOREIGN KEY (INV_REF)
 REFERENCES tbl_INVOICE(INV_REF),

 CONSTRAINT FK_SupplierOrderRef FOREIGN KEY (ORDER_REF)
 REFERENCES tbl_ORDER_DETAILS(ORDER_REF)

);

