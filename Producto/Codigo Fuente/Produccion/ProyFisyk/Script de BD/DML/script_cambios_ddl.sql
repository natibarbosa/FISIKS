
ALTER TABLE FISIKS.PACIENTE
MODIFY(PAEPESO INTEGER);



ALTER TABLE FISIKS.VACACIONES
 DROP PRIMARY KEY CASCADE;

DROP TABLE FISIKS.VACACIONES CASCADE CONSTRAINTS;

DROP SEQUENCE FISIKS.VACID;



CREATE SEQUENCE FISIKS.LCTID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;
  
CREATE TABLE FISIKS.LICENCIASTIPO
(
  LCTID           INTEGER                       NOT NULL,
  LCTDESCRIPCION  VARCHAR2(45 BYTE)
)
TABLESPACE FISIKS_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE OR REPLACE TRIGGER FISIKS.trg_lctid BEFORE INSERT ON FISIKS.LICENCIASTIPO  FOR EACH ROW
BEGIN   SELECT lctid.NEXTVAL INTO :new.lctid FROM DUAL; END;
/


ALTER TABLE FISIKS.LICENCIASTIPO ADD (
  PRIMARY KEY
 (LCTID)
    USING INDEX 
    TABLESPACE FISIKS_TBL
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

CREATE SEQUENCE FISIKS.LICID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;




CREATE TABLE FISIKS.LICENCIAS
(
  LICID          INTEGER                        NOT NULL,
  LICFECHADESDE  VARCHAR2(12 BYTE),
  LICFECHAHASTA  VARCHAR2(12 BYTE),
  LIC_PROID      INTEGER,
  LIC_LCTID      INTEGER
)
TABLESPACE FISIKS_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE OR REPLACE TRIGGER FISIKS.trg_licid BEFORE INSERT ON FISIKS.LICENCIAS  FOR EACH ROW
BEGIN   SELECT licid.NEXTVAL INTO :new.licid FROM DUAL; END;
/


ALTER TABLE FISIKS.LICENCIAS ADD (
  PRIMARY KEY
 (LICID)
    USING INDEX 
    TABLESPACE FISIKS_TBL
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE FISIKS.LICENCIAS ADD (
  CONSTRAINT FK_LIC_PROFESIONAL 
 FOREIGN KEY (LIC_PROID) 
 REFERENCES FISIKS.PROFESIONAL (PROID),
 CONSTRAINT FK_LIC_LICENCIASTIPO
 FOREIGN KEY (LIC_LCTID) 
 REFERENCES FISIKS.LICENCIASTIPO (LCTID));



ALTER TABLE FISIKS.PROFESIONAL
RENAME COLUMN PROTELEFONOINTERNO TO PROTELEFONO;



CREATE SEQUENCE FISIKS.EPCID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;

CREATE TABLE FISIKS.ESPECIALIDADES
(
  EPCID           INTEGER                       NOT NULL,
  EPCDESCRIPCION  VARCHAR2(45 BYTE)
)
TABLESPACE FISIKS_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE OR REPLACE TRIGGER FISIKS.trg_epcid BEFORE INSERT ON FISIKS.ESPECIALIDADES  FOR EACH ROW
BEGIN   SELECT epcid.NEXTVAL INTO :new.epcid FROM DUAL; END;
/


ALTER TABLE FISIKS.ESPECIALIDADES ADD (
  PRIMARY KEY
 (EPCID)
    USING INDEX 
    TABLESPACE FISIKS_TBL
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));




CREATE SEQUENCE FISIKS.EPTID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;
  
ALTER TABLE FISIKS.ESPECIALIDADESTIPO
 DROP PRIMARY KEY CASCADE;






CREATE SEQUENCE FISIKS.PEPID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE TABLE FISIKS.PROFESIONALESPECIALIDADES
(
  PEPID      INTEGER                            NOT NULL,
  PEP_PROID  INTEGER,
  PEP_EPCID  INTEGER
)
TABLESPACE FISIKS_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE OR REPLACE TRIGGER FISIKS.trg_pepid BEFORE INSERT ON FISIKS.PROFESIONALESPECIALIDADES  FOR EACH ROW
BEGIN   SELECT pepid.NEXTVAL INTO :new.pepid FROM DUAL; END;
/


ALTER TABLE FISIKS.PROFESIONALESPECIALIDADES ADD (
  PRIMARY KEY
 (PEPID)
    USING INDEX 
    TABLESPACE FISIKS_TBL
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE FISIKS.PROFESIONALESPECIALIDADES ADD (
  CONSTRAINT FK_PEP_ESPECIALIDAD 
 FOREIGN KEY (PEP_EPCID) 
 REFERENCES FISIKS.ESPECIALIDADES (EPCID),
  CONSTRAINT FK_PEP_PROFESIONAL
 FOREIGN KEY (PEP_PROID) 
 REFERENCES FISIKS.PROFESIONAL (PROID));