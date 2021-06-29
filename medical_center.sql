DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE disease (
    disease_id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE visit (
    visit_id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    doctor_id INT REFERENCES doctors ON DELETE CASCADE,
    patient_id INT REFERENCES patients ON DELETE CASCADE,
    disease_id INT REFERENCES disease ON DELETE CASCADE
);

-- SELECT * FROM visit v
--     JOIN doctors doc ON visit_id=doc.doctor_id
--     JOIN patients pat ON visit_id=pat.patient_id
--     JOIN disease dis ON visit_id=dis.disease_id