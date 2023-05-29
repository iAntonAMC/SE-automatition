DROP TABLE IF EXISTS catalogo;
CREATE TABLE catalogo (
    TIPO_DOCTO INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DESC_TPO_DOCTO VARCHAR(200) NOT NULL,
    ORDEN_TPO INTEGER NOT NULL
)ENGINE=INNODB;


-- Table DOCUMENTOS it's similar to current table, however this one uses the 'CUERPO_DOCTO' column
DROP TABLE IF EXISTS documentos;
CREATE TABLE documentos (
    ID_DOCTO INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TIPO_DOCTO INTEGER NOT NULL,
    TITULO_DOCTO TEXT(200) NOT NULL,
    CUERPO_DOCTO TEXT NOT NULL,
    PUBLICAR VARCHAR(2) NOT NULL,
    CVE_NIVEL INTEGER NOT NULL,
    CVE_CALENDARIO TEXT(100) NOT NULL,
    CAMPUS INTEGER NOT NULL,
    FECHA_REGISTRO TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    AUTOR_REGISTRO VARCHAR(10) NOT NULL,
    FECHA_MODIFICACION DATE DEFAULT NULL,
    AUTOR_MODIFICACION VARCHAR(10) DEFAULT NULL,
    FOREIGN KEY (TIPO_DOCTO) REFERENCES catalogo(TIPO_DOCTO)
)ENGINE=INNODB;

CREATE INDEX id_tipo ON documentos(ID_DOCTO, TIPO_DOCTO);
CREATE INDEX id_titulo ON documentos(ID_DOCTO, TITULO_DOCTO);
CREATE INDEX id_nivel_calendario ON documentos(ID_DOCTO, CVE_NIVEL, CVE_CALENDARIO);
