DROP TABLE IF EXISTS catalogo;
CREATE TABLE catalogo (
    TIPO_DOCTO INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DESC_TPO_DOCTO VARCHAR(200) NOT NULL,
    ORDEN_TPO INTEGER NOT NULL
) ENGINE=INNODB;


-- Table DOCUMENTS it's similar to current table, however this one uses the 'CUERPO_DOCTO' field
DROP TABLE IF EXISTS documents;
CREATE TABLE documents (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TIPO_DOCTO INTEGER NOT NULL,
    TITULO_DOCTO TEXT(200) NOT NULL,
    CUERPO_DOCTO LONGTEXT NOT NULL,
    PUBLICAR VARCHAR(2) NOT NULL,
    CVE_NIVEL INTEGER NOT NULL,
    CVE_CALENDARIO TEXT(100) NOT NULL,
    CAMPUS INTEGER NOT NULL,
    FECHA_REGISTRO TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    AUTOR_REGISTRO VARCHAR(10) NOT NULL,
    FECHA_MODIFICACION DATE DEFAULT NULL,
    AUTOR_MODIFICACION VARCHAR(10) DEFAULT NULL
) ENGINE=INNODB;

CREATE INDEX id_tipo ON documents(id, TIPO_DOCTO);
CREATE INDEX id_titulo ON documents(id, TITULO_DOCTO);
CREATE INDEX id_nivel_calendario ON documents(id, CVE_NIVEL, CVE_CALENDARIO);


-- Temporal saving table:
    -- This table is used to save the document while the user is editing it
    -- It could be not used if's not desired
DROP TABLE IF EXISTS temporal_saves;
CREATE TABLE temporal_saves (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TIPO_DOCTO INTEGER NOT NULL,
    TITULO_DOCTO TEXT(200) NOT NULL,
    CUERPO_DOCTO LONGTEXT NOT NULL,
    PUBLICAR VARCHAR(2) NOT NULL,
    CVE_NIVEL INTEGER NOT NULL,
    CVE_CALENDARIO TEXT(100) NOT NULL,
    CAMPUS INTEGER NOT NULL,
    FECHA_REGISTRO TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=INNODB;


-- PDF Filler 
DROP TABLE IF EXISTS pdfs;
CREATE TABLE pdfs (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CUERPO_DOCTO LONGTEXT NOT NULL
) ENGINE=INNODB;
