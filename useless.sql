CREATE OR REPLACE TYPE PhoneNumber_list AS TABLE OF VARCHAR2(20);
/
CREATE OR REPLACE TYPE Email_list AS TABLE OF VARCHAR2(10);
/

CREATE OR REPLACE TYPE demo AS OBJECT (
  name VARCHAR2(50),
  phone_numbers PhoneNumberList,
  hobbies HobbyList
);
/

CREATE TABLE demo_table (
  name VARCHAR2(50),
  phone_numbers PhoneNumberList,
  hobbies HobbyList
) NESTED TABLE phone_numbers STORE AS phone_numbers_nested
  NESTED TABLE hobbies STORE AS hobbies_nested;
/


INSERT INTO demo_table (
  name, 
  phone_numbers, 
  hobbies
) VALUES (
  'John Doe', 
  PhoneNumberList('123-456-7890', '987-654-3210'), 
  HobbyList('Reading', 'Swimming')
);





CREATE OR REPLACE TYPE PersonType AS OBJECT (
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  birth_date DATE
);

CREATE TABLE People (
  person_id NUMBER,
  person_data PersonType
);

INSERT INTO People VALUES (
  1,
  PersonType('John', 'Doe', TO_DATE('1990-01-15', 'YYYY-MM-DD'))
);

SELECT p.person_data.first_name, p.person_data.last_name
FROM People p;