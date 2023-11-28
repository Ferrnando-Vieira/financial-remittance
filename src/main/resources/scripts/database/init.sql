-- Create the schema
CREATE SCHEMA remittance;

-- Create the user
CREATE USER remittAdm PASSWORD '@dm1nR3m1tt-p0stGr3sSql';

-- Grant privileges to the user on the schema
GRANT ALL PRIVILEGES ON SCHEMA remittance TO remittAdm;

-- Set the default privileges for future objects in the schema
ALTER DEFAULT PRIVILEGES IN SCHEMA remittance
    GRANT ALL PRIVILEGES ON TABLES TO remittAdm;

-- Set the default encoding for the database to UTF-8
ALTER DATABASE remittance SET client_encoding TO 'UTF8';
ALTER ROLE remittAdm SET search_path TO remittance;

CREATE TABLE remittance.user (
    user_id SERIAL NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(100) NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    is_legal_entity BOOLEAN NOT NULL DEFAULT FALSE,
    dt_hour_creation TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id)
);

CREATE TABLE remittance.currency (
    currency_id INT NOT NULL,
    description VARCHAR(100) NOT NULL,
    code VARCHAR(3) NOT NULL,
    PRIMARY KEY (currency_id)
);

CREATE TABLE remittance.country (
    country_id INT NOT NULL,
    description VARCHAR(100) NOT NULL,
    phone_code VARCHAR(3) NOT NULL,
    currency_id INT NOT NULL,
    PRIMARY KEY (country_id),
    FOREIGN KEY (currency_id) REFERENCES remittance.currency(currency_id)
);

CREATE TABLE remittance.document_type (
    doc_type_id SERIAL NOT NULL,
    description VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (doc_type_id),
    FOREIGN KEY (country_id) REFERENCES remittance.country(country_id)
);

CREATE TABLE remittance.person (
    person_id SERIAL NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    cellphone VARCHAR(20) NOT NULL,
    birthdate DATE NOT NULL,
    document VARCHAR(50) NOT NULL,
    doc_type_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (person_id),
    FOREIGN KEY (doc_type_id) REFERENCES remittance.document_type(doc_type_id),
    FOREIGN KEY (user_id) REFERENCES remittance.user(user_id)
);

CREATE TABLE remittance.legal_entity (
    legal_entity_id SERIAL NOT NULL,
    fullName VARCHAR(200) NOT NULL,
    dt_legal_entity_creation DATE NOT NULL DEFAULT NOW(),
    document VARCHAR(50) NOT NULL,
    doc_type_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (legal_entity_id),
    FOREIGN KEY (doc_type_id) REFERENCES remittance.document_type(doc_type_id),
    FOREIGN KEY (user_id) REFERENCES remittance.user(user_id)
);

-- Currency
INSERT INTO remittance.currency (currency_id, description, code) VALUES (1, 'Real', 'BRL');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (2, 'Dollar', 'USD');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (3, 'Euro', 'EUR');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (4, 'Peso', 'MXN');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (5, 'Bitcoin', 'BTC');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (6, 'Yen', 'JPY');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (7, 'Pound', 'GBP');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (8, 'Australian Dollar', 'AUD');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (9, 'Canadian Dollar', 'CAD');
INSERT INTO remittance.currency (currency_id, description, code) VALUES (10, 'Swiss Franc', 'CHF');

-- Country
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (1, 'Brazil', '55', 1);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (2, 'United States', '1', 2);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (3, 'United Kingdom', '44', 7);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (4, 'Japan', '81', 6);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (5, 'Australia', '61', 8);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (6, 'Canada', '1', 9);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (7, 'Switzerland', '41', 10);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (8, 'Mexico', '52', 4);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (9, 'Germany', '49', 7);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (10, 'France', '33', 7);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (11, 'Italy', '39', 7);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (12, 'Netherlands', '31', 7);
INSERT INTO remittance.country (country_id, description, phone_code, currency_id) VALUES (13, 'Spain', '34', 7);

-- Document Type - Brazil
INSERT INTO remittance.document_type (description, country_id) VALUES ('Cadastro de Pessoa Física (CPF)', 1);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Carteira de Identidade (RG)', 1);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Cadastro Nacional da Pessoa Jurídica (CNPJ)', 1);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passaporte', 1);

-- Document type - United States
INSERT INTO remittance.document_type (description, country_id) VALUES ('Social Security Card (SSN)', 2);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Drivers License', 2);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Employer Identification Number (EIN)', 2);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business License', 2);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 2);

-- Document type - United Kingdom
INSERT INTO remittance.document_type (description, country_id) VALUES ('National Insurance Number (NI)', 3);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Driving Licence', 3);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Companies House Number (CH)', 3);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Registration Certificate', 3);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 3);

-- Document type - Japan
INSERT INTO remittance.document_type (description, country_id) VALUES ('My Number Card', 4);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Driving Licence', 4);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 4);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Corporate Code Number (CCN)', 4);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Registration Certificate', 4);

-- Document type - Australia
INSERT INTO remittance.document_type (description, country_id) VALUES ('Australian Birth Certificate', 5);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 5);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Driving Licence', 5);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Australian Business Number (ABN)', 5);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Registration Certificate', 5);

-- Document type - Canada
INSERT INTO remittance.document_type (description, country_id) VALUES ('Social Insurance Number (SIN)', 6);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 6);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Driving Licence', 6);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Number (BN)', 6);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Registration Certificate', 6);

-- Document type - Switzerland
INSERT INTO remittance.document_type (description, country_id) VALUES ('Swiss Identity Card (ID Card)', 7);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passport', 7);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Driving Licence', 7);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Swiss Company Registration Number (CHE)', 7);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Business Registration Certificate', 7);

-- Document type - Mexico
INSERT INTO remittance.document_type (description, country_id) VALUES ('Clave Única de Registro de Población (CURP)', 8);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Pasaporte', 8);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Licencia de conducir', 8);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Registro Federal de Contribuyentes (RFC)', 8);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Licencia de funcionamiento', 8);

-- Document type - Germany
INSERT INTO remittance.document_type (description, country_id) VALUES ('Handelsregisternummer (HRN)', 9);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Gewerbeschein', 9);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Personalausweis', 9);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Führerschein', 9);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Reisepass', 9);

-- Document type - France
INSERT INTO remittance.document_type (description, country_id) VALUES ('Carte d''identité', 10);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Permis de conduire', 10);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passeport', 10);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Siret', 10);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Kbis', 10);

-- Document type - Italy
INSERT INTO remittance.document_type (description, country_id) VALUES ('Carta d''identità', 11);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Patente di guida', 11);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Passaporto', 11);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Codice Fiscale', 11);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Partita IVA', 11);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Registro delle Imprese', 11);

-- Document type - Netherlands
INSERT INTO remittance.document_type (description, country_id) VALUES ('Persoonsbewijs', 12);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Rijbewijs', 12);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Paspoort', 12);
INSERT INTO remittance.document_type (description, country_id) VALUES ('KVK-nummer', 12);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Handelsregister', 12);

-- Document type - Spain
INSERT INTO remittance.document_type (description, country_id) VALUES ('Número de Identificación Fiscal (NIF)', 13);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Documento Nacional de Identidad (DNI)', 13);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Permiso de conducir', 13);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Número de Identificación de la Empresa (NIE)', 13);
INSERT INTO remittance.document_type (description, country_id) VALUES ('Pasaporte', 13);