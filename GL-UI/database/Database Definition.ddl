-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2019-10-14 11:18:29 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Acc_Code
  (
    Acc_ID         INTEGER NOT NULL ,
    Acc_Code       VARCHAR2 (13) NOT NULL ,
    Acc_Name       VARCHAR2 (50) NOT NULL ,
    Acc_Control    VARCHAR2 (9) ,
    Acc_Type       CHAR (1) ,
    Acc_Status     CHAR (1) NOT NULL ,
    Acc_OpBal      NUMBER ,
    Acc_OpDate     DATE NOT NULL ,
    Acc_BalNat     CHAR (1) NOT NULL ,
    Acc_Nature     CHAR (1) NOT NULL ,
    Entered_By     SMALLINT ,
    Updated_By     SMALLINT ,
    Updated_On     DATE ,
    Entered_On     DATE ,
    Users_UserCode INTEGER NOT NULL
  ) ;
ALTER TABLE Acc_Code ADD CONSTRAINT Acc_Code_PK PRIMARY KEY ( Acc_ID ) ;


CREATE TABLE AccountingYear
  (
    AccYearID       INTEGER NOT NULL ,
    YearStarts      DATE NOT NULL ,
    YearEnds        DATE NOT NULL ,
    Acc_Code_Acc_ID INTEGER NOT NULL
  ) ;
ALTER TABLE AccountingYear ADD CONSTRAINT AccountingYear_PK PRIMARY KEY ( AccYearID ) ;


CREATE TABLE ActivityLog
  (
    LogID          INTEGER NOT NULL ,
    Vno            VARCHAR2 (15) NOT NULL ,
    ActivityTime   DATE NOT NULL ,
    ActivityType   VARCHAR2 (15) NOT NULL ,
    UserCode       INTEGER NOT NULL ,
    UserName       VARCHAR2 (15) NOT NULL ,
    Users_UserCode INTEGER NOT NULL
  ) ;
ALTER TABLE ActivityLog ADD CONSTRAINT ActivityLog_PK PRIMARY KEY ( LogID ) ;


CREATE TABLE BalanceNature
  (
    BalanceNatureID INTEGER NOT NULL ,
    BalNature       VARCHAR2 (20) NOT NULL ,
    Acc_Code_Acc_ID INTEGER NOT NULL
  ) ;
ALTER TABLE BalanceNature ADD CONSTRAINT BalanceNature_PK PRIMARY KEY ( BalanceNatureID ) ;


CREATE TABLE Department
  (
    DeptCode INTEGER NOT NULL ,
    DeptName VARCHAR2 (30)
  ) ;
ALTER TABLE Department ADD CONSTRAINT Department_PK PRIMARY KEY ( DeptCode ) ;


CREATE TABLE GLDetail
  (
    GLID     INTEGER NOT NULL ,
    GLAccID  INTEGER NOT NULL ,
    GLAmount NUMBER NOT NULL ,
    GLType   CHAR (1) NOT NULL ,
    GL_Desc NVARCHAR2 (4000) NOT NULL ,
    GLChq_Cash NVARCHAR2 (20) NOT NULL ,
    Acc_Code_Acc_ID INTEGER NOT NULL
  ) ;
ALTER TABLE GLDetail ADD CONSTRAINT GLDetail_PK PRIMARY KEY ( GLID ) ;


CREATE TABLE GLMaster
  (
    GLID                  INTEGER NOT NULL ,
    GLTypeID              INTEGER NOT NULL ,
    GVno                  VARCHAR2 (15) NOT NULL ,
    GLVdate               DATE NOT NULL ,
    Entered_By            SMALLINT ,
    Updated_By            SMALLINT ,
    Entered_On            DATE ,
    Updated_On            DATE ,
    Users_UserCode        INTEGER NOT NULL ,
    VoucherType_VoucherID INTEGER NOT NULL
  ) ;
ALTER TABLE GLMaster ADD CONSTRAINT GLMaster_PK PRIMARY KEY ( GLID ) ;


CREATE TABLE Updates
  (
    Users_UserCode        INTEGER NOT NULL ,
    VoucherType_VoucherID INTEGER NOT NULL
  ) ;
ALTER TABLE Updates ADD CONSTRAINT Updates_PK PRIMARY KEY ( Users_UserCode, VoucherType_VoucherID ) ;


CREATE TABLE Updatesv1
  (
    Users_UserCode INTEGER NOT NULL ,
    GLMaster_GLID  INTEGER NOT NULL
  ) ;
ALTER TABLE Updatesv1 ADD CONSTRAINT Updatesv1_PK PRIMARY KEY ( Users_UserCode, GLMaster_GLID ) ;


CREATE TABLE Updatesv2
  (
    Users_UserCode  INTEGER NOT NULL ,
    Users_UserCode1 INTEGER NOT NULL
  ) ;
ALTER TABLE Updatesv2 ADD CONSTRAINT Updatesv2_PK PRIMARY KEY ( Users_UserCode, Users_UserCode1 ) ;


CREATE TABLE Updatesv4
  (
    Users_UserCode  INTEGER NOT NULL ,
    Acc_Code_Acc_ID INTEGER NOT NULL
  ) ;
ALTER TABLE Updatesv4 ADD CONSTRAINT Updatesv4_PK PRIMARY KEY ( Users_UserCode, Acc_Code_Acc_ID ) ;


CREATE TABLE Users
  (
    UserCode            INTEGER NOT NULL ,
    UserPass            VARCHAR2 (20) NOT NULL ,
    UserName            VARCHAR2 (30) ,
    DeptCode            INTEGER NOT NULL ,
    UserDisable         CHAR (1) NOT NULL ,
    Entered_By          SMALLINT NOT NULL ,
    Updated_By          SMALLINT NOT NULL ,
    Entered_On          DATE NOT NULL ,
    Updated_On          DATE NOT NULL ,
    Users_UserCode      INTEGER NOT NULL ,
    Department_DeptCode INTEGER NOT NULL
  ) ;
ALTER TABLE Users ADD CONSTRAINT Users_PK PRIMARY KEY ( UserCode ) ;


CREATE TABLE VoucherType
  (
    VoucherID         INTEGER NOT NULL ,
    VoucherType       CHAR (2) ,
    VoucherName       VARCHAR2 (25) ,
    Entered_By        SMALLINT ,
    Updated_By        SMALLINT ,
    Entered_On        DATE ,
    Updated_On        DATE ,
    ReservedType      CHAR (1) ,
    Users_UserCode    INTEGER NOT NULL ,
    ActivityLog_LogID INTEGER NOT NULL
  ) ;
ALTER TABLE VoucherType ADD CONSTRAINT VoucherType_PK PRIMARY KEY ( VoucherID ) ;


ALTER TABLE Acc_Code ADD CONSTRAINT Acc_Code_Users_FK FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE AccountingYear ADD CONSTRAINT AccountingYear_Acc_Code_FK FOREIGN KEY ( Acc_Code_Acc_ID ) REFERENCES Acc_Code ( Acc_ID ) ;

ALTER TABLE ActivityLog ADD CONSTRAINT ActivityLog_Users_FK FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE BalanceNature ADD CONSTRAINT BalanceNature_Acc_Code_FK FOREIGN KEY ( Acc_Code_Acc_ID ) REFERENCES Acc_Code ( Acc_ID ) ;

ALTER TABLE Updates ADD CONSTRAINT FK_ASS_11 FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE Updates ADD CONSTRAINT FK_ASS_12 FOREIGN KEY ( VoucherType_VoucherID ) REFERENCES VoucherType ( VoucherID ) ;

ALTER TABLE Updatesv1 ADD CONSTRAINT FK_ASS_13 FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE Updatesv1 ADD CONSTRAINT FK_ASS_14 FOREIGN KEY ( GLMaster_GLID ) REFERENCES GLMaster ( GLID ) ;

ALTER TABLE Updatesv2 ADD CONSTRAINT FK_ASS_15 FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE Updatesv2 ADD CONSTRAINT FK_ASS_16 FOREIGN KEY ( Users_UserCode1 ) REFERENCES Users ( UserCode ) ;

ALTER TABLE Updatesv4 ADD CONSTRAINT FK_ASS_17 FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE Updatesv4 ADD CONSTRAINT FK_ASS_18 FOREIGN KEY ( Acc_Code_Acc_ID ) REFERENCES Acc_Code ( Acc_ID ) ;

ALTER TABLE GLDetail ADD CONSTRAINT GLDetail_Acc_Code_FK FOREIGN KEY ( Acc_Code_Acc_ID ) REFERENCES Acc_Code ( Acc_ID ) ;

ALTER TABLE GLMaster ADD CONSTRAINT GLMaster_Users_FK FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE GLMaster ADD CONSTRAINT GLMaster_VoucherType_FK FOREIGN KEY ( VoucherType_VoucherID ) REFERENCES VoucherType ( VoucherID ) ;

ALTER TABLE Users ADD CONSTRAINT Users_Department_FK FOREIGN KEY ( Department_DeptCode ) REFERENCES Department ( DeptCode ) ;

ALTER TABLE Users ADD CONSTRAINT Users_Users_FK FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;

ALTER TABLE VoucherType ADD CONSTRAINT VoucherType_ActivityLog_FK FOREIGN KEY ( ActivityLog_LogID ) REFERENCES ActivityLog ( LogID ) ;

ALTER TABLE VoucherType ADD CONSTRAINT VoucherType_Users_FK FOREIGN KEY ( Users_UserCode ) REFERENCES Users ( UserCode ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
