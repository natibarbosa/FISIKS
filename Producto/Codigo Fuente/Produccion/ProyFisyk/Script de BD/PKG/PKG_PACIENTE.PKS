DROP PACKAGE FISIKS.PKG_PACIENTE;

CREATE OR REPLACE PACKAGE FISIKS.PKG_PACIENTE AS

PROCEDURE PRC_PACIENTE_SELECT (
    iPsnnrodcto               IN PERSONA.PSNNRODCTO %TYPE,
    oCursorPersona          OUT sys_refcursor);


PROCEDURE PRC_PACIENTE_INSERT (
    iPAEPESO                IN PACIENTE.PAEPESO%TYPE,
    iPAEALTURA            IN PACIENTE.PAEALTURA%TYPE := NULL,
    iPAEACTFISICA        IN PACIENTE.PAEACTFISICA%TYPE := NULL,
    iPAEPERIODICIDAD   IN PACIENTE.PAEPERIODICIDAD%TYPE := NULL,
    iPAE_PSNID              IN PACIENTE.PAE_PSNID%TYPE := NULL);

PROCEDURE PRC_PACIENTEOS_INSERT (
    iOSP_PAEID            IN PACIENTEOS.OSP_PAEID%TYPE :=NULL,
    iOSP_OSOID           IN PACIENTEOS.OSP_OSOID%TYPE := NULL,
    iOSPNROSOCIO       IN PACIENTEOS.OSPNROSOCIO%TYPE := NULL);

PROCEDURE PRC_PACIENTEOCUPACIONES_INSERT (
    iOPA_PAEID            IN PACIENTEOCUPACIONES.OPA_PAEID%TYPE :=NULL,
    iOPA_OCUID           IN PACIENTEOCUPACIONES.OPA_OCUID%TYPE := NULL);

END;
/
DROP PACKAGE BODY FISIKS.PKG_PACIENTE;

CREATE OR REPLACE PACKAGE BODY FISIKS.PKG_PACIENTE AS

PROCEDURE PRC_PACIENTE_SELECT (
    iPsnnrodcto               IN PERSONA.PSNNRODCTO %TYPE,
    oCursorPersona          OUT sys_refcursor)
AS
BEGIN

    OPEN oCursorPersona FOR
   SELECT   *
   FROM     PERSONA , PACIENTE
   WHERE   PAE_PSNID = PSNID
   AND       PSNNRODCTO = iPsnnrodcto;

END;



PROCEDURE PRC_PACIENTE_INSERT (
    iPAEPESO                IN PACIENTE.PAEPESO%TYPE,
    iPAEALTURA            IN PACIENTE.PAEALTURA%TYPE := NULL,
    iPAEACTFISICA        IN PACIENTE.PAEACTFISICA%TYPE := NULL,
    iPAEPERIODICIDAD   IN PACIENTE.PAEPERIODICIDAD%TYPE := NULL,
    iPAE_PSNID              IN PACIENTE.PAE_PSNID%TYPE := NULL)
AS
BEGIN
        INSERT INTO PACIENTE
            (PAEPESO,
            PAEALTURA,
            PAEACTFISICA,
            PAEPERIODICIDAD,
            PAE_PSNID)
        VALUES
            (iPAEPESO,
            iPAEALTURA,
            iPAEACTFISICA,
            iPAEPERIODICIDAD,
            iPAE_PSNID);
END;

PROCEDURE PRC_PACIENTEOS_INSERT (
    iOSP_PAEID            IN PACIENTEOS.OSP_PAEID%TYPE :=NULL,
    iOSP_OSOID           IN PACIENTEOS.OSP_OSOID%TYPE := NULL,
    iOSPNROSOCIO       IN PACIENTEOS.OSPNROSOCIO%TYPE := NULL)
AS
BEGIN

        INSERT INTO PACIENTEOS
            (OSP_PAEID,
            OSP_OSOID,
            OSPNROSOCIO)
        VALUES
            (iOSP_PAEID,
            iOSP_OSOID,
            iOSPNROSOCIO);

END;

PROCEDURE PRC_PACIENTEOCUPACIONES_INSERT (
    iOPA_PAEID            IN PACIENTEOCUPACIONES.OPA_PAEID%TYPE :=NULL,
    iOPA_OCUID           IN PACIENTEOCUPACIONES.OPA_OCUID%TYPE := NULL)
AS
BEGIN

        INSERT INTO PACIENTEOCUPACIONES
            (OPA_PAEID,
            OPA_OCUID)
        VALUES
            (iOPA_PAEID,
            iOPA_OCUID);

END;
END;
/
