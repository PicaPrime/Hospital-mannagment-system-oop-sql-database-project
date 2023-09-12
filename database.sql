CREATE OR REPLACE TYPE NameType AS object(
    first_name VARCHAR(50),
    last_name VARCHAR(50)
); 

CREATE OR REPLACE TYPE PhoneNumber_list AS TABLE OF VARCHAR2(20);

CREATE OR REPLACE TYPE Email_list AS TABLE OF VARCHAR2(10);

CREATE TYPE PersonType AS object(
    name NameType,
    address VARCHAR(50),
    date_of_birth DATE,
    emails Email_list,
    phone_numbers PhoneNumber_list,
    gender CHAR(1) -- Assuming 'M' for Male, 'F' for Female, 'O' for Other, etc.
)not final;

create or REPLACE type DoctorType under PersonType (
    doctor_id INT,
    salary_doctor INT,
    specialization VARCHAR(50),
    contact_info VARCHAR(100)
);


CREATE TABLE doctors (
    doctor_data DoctorType
) NESTED TABLE doctor_data.emails STORE AS doctor_emails_nested
  NESTED TABLE doctor_data.phone_numbers STORE AS doctor_phone_numbers_nested;

create type PatientType under PersonType (
    patient_id INT,
    medical_history VARCHAR(100),
    insurance_info VARCHAR(100)
);

CREATE TABLE patients (
    patient_data PatientType
) NESTED TABLE patient_data.emails STORE AS patient_emails_nested
  NESTED TABLE patient_data.phone_numbers STORE AS patient_phone_numbers_nested;

CREATE TYPE EmployeeType under PersonType(
    employee_id INT,
    position VARCHAR(50),
    salary_employee INT,
    contact_info VARCHAR(100),
    hire_date DATE
);


CREATE TABLE empolyees (
    employee_data EmployeeType
) NESTED TABLE employee_data.emails STORE AS employee_emails_nested
  NESTED TABLE employee_data.phone_numbers STORE AS employee_phone_numbers_nested;

-- Appointment MedicalRecords Inventory Nurse 


CREATE OR REPLACE MedicineType AS OBJECT(
    medicine_id INT,
    medicine_name VARCHAR(20),
    quantity INT,
    medicine_type VARCHAR(20)
);

CREATE OR REPLACE TYPE Medicine_list AS table or MedicineType;

create table invertory (
    invertory_id INT,
    medicines Medicine_list
)NESTED TABLE medicines STORE AS medicines_nested;