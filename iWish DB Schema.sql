--------------------------------------------------------
--  File created - Wednesday-December-30-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "PRODUCTS" 
   (	"PROD_ID" NUMBER, 
	"PROD_NAME" VARCHAR2(20 BYTE), 
	"PROD_PRICE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"USER_NAME" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"AMOUNT_OF_MONEY" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table USERS_CONTRIBUTIONS
--------------------------------------------------------

  CREATE TABLE "USERS_CONTRIBUTIONS" 
   (	"USER_NAME" VARCHAR2(30 BYTE), 
	"ITEM" NUMBER, 
	"CONTRIBUTOR_NAME" VARCHAR2(20 BYTE), 
	"AMOUNT_OF_CONTRIBUTION" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table USERS_FRIEND_LIST
--------------------------------------------------------

  CREATE TABLE "USERS_FRIEND_LIST" 
   (	"USER_NAME1" VARCHAR2(30 BYTE), 
	"USER_NAME2" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table USERS_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "USERS_PRODUCTS" 
   (	"USER_NAME" VARCHAR2(30 BYTE), 
	"PROD_ID" NUMBER, 
	"TOTAL_CONTRIBUTION" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table FRIEND_REQUESTS
--------------------------------------------------------

	CREATE TABLE "FRIEND_REQUESTS"
	(
	  "USER1"  VARCHAR2(30 BYTE),
	  "USER2"  VARCHAR2(30 BYTE)
	);

---------------------------------------------------
--   DATA FOR TABLE PRODUCTS
--   FILTER = none used
---------------------------------------------------
Insert into PRODUCTS (PROD_ID,PROD_NAME,PROD_PRICE) values (1,'iPhone',15000);
Insert into PRODUCTS (PROD_ID,PROD_NAME,PROD_PRICE) values (2,'Laptop',30000);
Insert into PRODUCTS (PROD_ID,PROD_NAME,PROD_PRICE) values (3,'Apple Watch',7000);
Insert into PRODUCTS (PROD_ID,PROD_NAME,PROD_PRICE) values (4,'Dress',2000);

---------------------------------------------------
--   END DATA FOR TABLE PRODUCTS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE USERS_FRIEND_LIST
--   FILTER = none used
---------------------------------------------------
Insert into USERS_FRIEND_LIST (USER_NAME1,USER_NAME2) values ('esraa','sara');
Insert into USERS_FRIEND_LIST (USER_NAME1,USER_NAME2) values ('islam','radwa');
Insert into USERS_FRIEND_LIST (USER_NAME1,USER_NAME2) values ('radwa','islam');
Insert into USERS_FRIEND_LIST (USER_NAME1,USER_NAME2) values ('sara','esraa');

---------------------------------------------------
--   END DATA FOR TABLE USERS_FRIEND_LIST
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE USERS_PRODUCTS
--   FILTER = none used
---------------------------------------------------
Insert into USERS_PRODUCTS (USER_NAME,PROD_ID,TOTAL_CONTRIBUTION) values ('sara',2,0);
Insert into USERS_PRODUCTS (USER_NAME,PROD_ID,TOTAL_CONTRIBUTION) values ('islam',3,0);
Insert into USERS_PRODUCTS (USER_NAME,PROD_ID,TOTAL_CONTRIBUTION) values ('esraa',4,0);
Insert into USERS_PRODUCTS (USER_NAME,PROD_ID,TOTAL_CONTRIBUTION) values ('radwa',1,0);

---------------------------------------------------
--   END DATA FOR TABLE USERS_PRODUCTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE USERS
--   FILTER = none used
---------------------------------------------------
Insert into USERS (USER_NAME,PASSWORD,EMAIL,AMOUNT_OF_MONEY) values ('sara','1234','sara@gmail.com',1000);
Insert into USERS (USER_NAME,PASSWORD,EMAIL,AMOUNT_OF_MONEY) values ('esraa','1234','esraa@gmail.com',1000);
Insert into USERS (USER_NAME,PASSWORD,EMAIL,AMOUNT_OF_MONEY) values ('radwa','1234','radwa@gmail.com',1000);
Insert into USERS (USER_NAME,PASSWORD,EMAIL,AMOUNT_OF_MONEY) values ('islam','1234','islam@gmail.com',1000);

---------------------------------------------------
--   END DATA FOR TABLE USERS
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "PRODUCTS" ADD CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ("PROD_ID") ENABLE;
 
  ALTER TABLE "PRODUCTS" MODIFY ("PROD_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCTS" MODIFY ("PROD_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCTS" MODIFY ("PROD_PRICE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("AMOUNT_OF_MONEY" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_NAME") ENABLE;

--------------------------------------------------------
--  Constraints for Table USERS_FRIEND_LIST
--------------------------------------------------------

  ALTER TABLE "USERS_FRIEND_LIST" MODIFY ("USER_NAME1" NOT NULL ENABLE);
 
  ALTER TABLE "USERS_FRIEND_LIST" MODIFY ("USER_NAME2" NOT NULL ENABLE);
 
  ALTER TABLE "USERS_FRIEND_LIST" ADD CONSTRAINT "USERS_FRIEND_LIST_PK" PRIMARY KEY ("USER_NAME1", "USER_NAME2") ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "USERS_PRODUCTS" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS_PRODUCTS" MODIFY ("PROD_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USERS_PRODUCTS" ADD CONSTRAINT "USERS_PRODUCTS_PK" PRIMARY KEY ("USER_NAME", "PROD_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table FRIEND_REQUESTS
--------------------------------------------------------
ALTER TABLE "FRIEND_REQUESTS" ADD CONSTRAINT "FRIEND_REQUESTS_PK" PRIMARY KEY("USER1", "USER2")ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table FRIEND_REQUESTS
--------------------------------------------------------

  ALTER TABLE "FRIEND_REQUESTS" ADD CONSTRAINT "FRIEND_REQUESTS_FK" FOREIGN KEY ("USER1") 
	  REFERENCES "USERS" ("USER_NAME")ENABLE;
	  
  ALTER TABLE "FRIEND_REQUESTS" ADD CONSTRAINT "FRIEND_REQUESTS_FK2" FOREIGN KEY ("USER2") 
	  REFERENCES "USERS" ("USER_NAME")ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table USERS_FRIEND_LIST
--------------------------------------------------------

  ALTER TABLE "USERS_FRIEND_LIST" ADD CONSTRAINT "FK_FRIEND1_USER_NAME" FOREIGN KEY ("USER_NAME1")
	  REFERENCES "USERS" ("USER_NAME") ENABLE;
 
  ALTER TABLE "USERS_FRIEND_LIST" ADD CONSTRAINT "FK_FRIEND2_USER_NAME" FOREIGN KEY ("USER_NAME2")
	  REFERENCES "USERS" ("USER_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USERS_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "USERS_PRODUCTS" ADD CONSTRAINT "FK_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "PRODUCTS" ("PROD_ID") ENABLE;
 
  ALTER TABLE "USERS_PRODUCTS" ADD CONSTRAINT "FK_USER_NAME" FOREIGN KEY ("USER_NAME")
	  REFERENCES "USERS" ("USER_NAME") ENABLE;
	  
---------------------------------------------------------
-- SEQUENCE PROD_SEQ 
------------------------------------------------------
CREATE SEQUENCE PROD_SEQ
START WITH 5
MAXVALUE 9999999999999999999999999999
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER

--------------------------------------------------------

ALTER TABLE PRODUCTS
    ADD
        Stock  NUMBER (10) ;

----------------------------------------------------------
ALTER TABLE USERS_PRODUCTS
DROP CONSTRAINT  FK_PROD_ID ;
ALTER TABLE USERS_PRODUCTS
ADD CONSTRAINT FK_PROD_ID  
FOREIGN KEY (PROD_ID)  
REFERENCES PRODUCTS (PROD_ID) ON DELETE CASCADE;