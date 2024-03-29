database AP_DM01;

CREATE MULTISET TABLE AP_DM01.SFA_GARANT_DN2 ,FALLBACK ,
     MAP = TD_MAP1
     (
      llp_ico VARCHAR(10) CHARACTER SET UNICODE,
      accountid CHAR(38) CHARACTER SET UNICODE,
      PrimaryGarant CHAR(1) CHARACTER SET LATIN,
      grnt_login VARCHAR(100) CHARACTER SET UNICODE,
      grnt_firstname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_lastname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_llp_pozice VARCHAR(100) CHARACTER SET UNICODE,
      grnt_llp_typgaranta_pozice VARCHAR(15) CHARACTER SET UNICODE,
      grnt_llp_typgaranta VARCHAR(100) CHARACTER SET UNICODE,
      grnt_BusinessUnitName VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt1_login VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt1_firstname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt1_lastname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt1_llp_pozice VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt1_llp_typgaranta_pozice VARCHAR(15) CHARACTER SET UNICODE,
      grnt_prnt1_BusinessUnitName VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt2_login VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt2_firstname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt2_lastname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt2_llp_pozice VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt2_llp_typgaranta_pozice VARCHAR(15) CHARACTER SET UNICODE,
      grnt_prnt2_BusinessUnitName VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt3_login VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt3_firstname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt3_lastname VARCHAR(64) CHARACTER SET UNICODE,
      grnt_prnt3_llp_pozice VARCHAR(100) CHARACTER SET UNICODE,
      grnt_prnt3_llp_typgaranta_pozice VARCHAR(15) CHARACTER SET UNICODE,
      grnt_prnt3_BusinessUnitName VARCHAR(100) CHARACTER SET UNICODE,
      llp_cislozakaznikavcld VARCHAR(10) CHARACTER SET UNICODE,
      grnt_SystemUserTeamId VARCHAR(38) CHARACTER SET LATIN,
      grnt_ModifiedOn TIMESTAMP(0),
      grnt_prnt1_SystemUserTeamId VARCHAR(38) CHARACTER SET LATIN,
      grnt_prnt1_ModifiedOn TIMESTAMP(0),
      grnt_GarantModifiedon TIMESTAMP(0),
      map_id INTEGER NOT NULL,
      mart_start_job_id INTEGER NOT NULL)
PRIMARY INDEX SFA_GARANT_DN2_NUPI( accountid );




