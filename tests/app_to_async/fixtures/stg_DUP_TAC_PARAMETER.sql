database EP_STG;

CREATE MULTISET TABLE EP_STG.DUP_TAC_PARAMETER ,FALLBACK 
     (
      tac_phone_cd VARCHAR(10) CHARACTER SET UNICODE NOT NULL,
      tac_parameter_cd INTEGER NOT NULL,
      tac_parameter_val VARCHAR(2000) CHARACTER SET UNICODE COMPRESS ('1','Handheld','GSM,WCDMA,LTE-FDD,LTE-TDD','Samsung Korea','GSM 1800,GSM 900','0','Nokia Corporation','Smartphone','GSM 900,GSM 1800','NONE','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800)','2009q4 and older','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8','Android','Ericsson Mobile Comms AB','GSM 900,GSM 1900,GSM 1800,GSM850 (GSM800)','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 8','GSM,WCDMA','201101 and older','Nokia','HUAWEI Technologies Co Ltd','GSM','GSM,WCDMA,LTE-FDD','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 2,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE FDD BAND 12,LTE FDD BAND 13,LTE FDD BAND 17,LTE FDD BAND 18,LTE FDD BAND 19,LTE FDD BAND 20,LTE FDD BAND 25,LTE FDD BAND 26,LTE FDD BAND 27,LTE FDD BAND 28,LTE FDD BAND 29,LTE FDD Band 30,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8','GSM 1800,GSM 1900,GSM 900','Samsung','Motorola Mobility LLC, a Lenovo Company','GSM 900,GSM 1900,GSM 1800','Mobile Phone/Feature phone','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 2,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE FDD BAND 12,LTE FDD BAND 13,LTE FDD BAND 17,LTE FDD BAND 18,LTE FDD BAND 19,LTE FDD BAND 20,LTE FDD BAND 24,LTE FDD BAND 25,LTE FDD BAND 26,LTE FDD BAND 27,LTE FDD BAND 28,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8','Guangdong Oppo Mobile Telecommunications Corp Ltd','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 2,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE FDD BAND 12,LTE FDD BAND 13,LTE FDD BAND 17,LTE FDD BAND 18,LTE FDD BAND 19,LTE FDD BAND 20,LTE FDD BAND 25,LTE FDD BAND 26,LTE FDD BAND 27,LTE FDD BAND 28,LTE FDD BAND 29,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8,WCDMA TDD Band A','EDGE,GPRS','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 2,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE FDD BAND 12,LTE FDD BAND 13,LTE FDD BAND 17,LTE FDD BAND 18,LTE FDD BAND 19,LTE FDD BAND 20,LTE FDD BAND 25,LTE FDD BAND 26,LTE FDD BAND 27,LTE FDD BAND 28,LTE FDD BAND 29,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8','LG Electronics Inc.','Y','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 13,LTE FDD BAND 17,LTE FDD BAND 18,LTE FDD BAND 19,LTE FDD BAND 2,LTE FDD BAND 20,LTE FDD BAND 25,LTE FDD BAND 26,LTE FDD BAND 28,LTE FDD BAND 29,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),TD-SCDMA,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8','WCDMA FDD Band I,WCDMA FDD Band VIII,GSM 900,GSM 1900,GSM 1800,WCDMA FDD Band II,WCDMA FDD Band V,GSM850 (GSM800)','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),HSDPA,HSUPA,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8','Motorola','WCDMA FDD Band I,WCDMA FDD Band VIII,HSDPA,GSM 900,GSM 1900,GSM 1800,WCDMA FDD Band II,WCDMA FDD Band V,GSM850 (GSM800),HSUPA','LTE FDD BAND 1,LTE FDD BAND 20,LTE FDD BAND 3,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8','LTE FDD BAND 1,LTE FDD BAND 20,LTE FDD BAND 3,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE TDD BAND 40,GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8','Xiaomi Communications Co Ltd','WCDMA FDD Band I,WCDMA FDD Band VIII,GSM 900,GSM 1900,GSM 1800,GSM850 (GSM800)','Sony Ericsson Mobile Communications AB','Apple','N','GSM 1900,GSM850 (GSM800)','Portable(include PDA)','Apple Inc.','Vivo Mobile Communication Co Ltd','Apple Inc','Motorola Inc.','Microsoft Mobile Oy, Nokia Corporation','LTE FDD BAND 1,LTE FDD BAND 3,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE FDD BAND 20,LTE TDD BAND 40,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8','GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),HSDPA,HSUPA,WCDMA FDD Band 1,WCDMA FDD Band 8','CDMA2000,LTE FDD BAND 1,LTE FDD BAND 3,LTE FDD BAND 5,LTE FDD BAND 7,LTE FDD BAND 8,LTE TDD BAND 34,LTE TDD BAND 38,LTE TDD BAND 39,LTE TDD BAND 40,LTE TDD BAND 41,GSM850 (GSM800),GSM 900,GSM 1800,GSM 1900,2.4-2.5 GHz,WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 5,WCDMA FDD Band 8,WCDMA TDD Band A','Huawei Technologies Co. Ltd.','WCDMA FDD Band I,GSM 900,GSM 1900,GSM 1800,WCDMA FDD Band II,WCDMA FDD Band V,GSM850 (GSM800)','GSM 900','LTE FDD BAND 1,LTE FDD BAND 17,LTE FDD BAND 2,LTE FDD BAND 28,LTE FDD BAND 3,LTE FDD BAND 4,LTE FDD BAND 5,LTE FDD BAND 7,GSM 1800,GSM 1900,GSM 900,GSM850 (GSM800),WCDMA FDD Band 1,WCDMA FDD Band 2,WCDMA FDD Band 4,WCDMA FDD Band 5,WCDMA FDD Band 8'),
      upd_dttm TIMESTAMP(0) NOT NULL COMPRESS (TIMESTAMP '2018-06-18 00:00:00',TIMESTAMP '2018-07-06 00:00:00',TIMESTAMP '2018-07-07 00:00:00'),
      active_flag CHAR(1) CHARACTER SET LATIN NOT NULL COMPRESS '1',
      load_id INTEGER NOT NULL COMPRESS (36638482 ,35747903 ,36599013 ),
      ins_dttm TIMESTAMP(0) NOT NULL COMPRESS (TIMESTAMP '2016-01-08 00:00:00',TIMESTAMP '2016-01-15 00:00:00',TIMESTAMP '2016-02-02 00:00:00',TIMESTAMP '2016-02-08 00:00:00',TIMESTAMP '2016-02-23 00:00:00',TIMESTAMP '2016-02-25 00:00:00',TIMESTAMP '2016-02-26 00:00:00',TIMESTAMP '2016-03-05 00:00:00',TIMESTAMP '2016-03-19 00:00:00',TIMESTAMP '2016-04-09 00:00:00',TIMESTAMP '2016-05-02 00:00:00',TIMESTAMP '2016-05-11 00:00:00',TIMESTAMP '2016-06-04 00:00:00',TIMESTAMP '2016-06-07 00:00:00',TIMESTAMP '2016-08-04 00:00:00',TIMESTAMP '2016-08-09 00:00:00',TIMESTAMP '2016-08-11 00:00:00',TIMESTAMP '2016-09-07 00:00:00',TIMESTAMP '2016-10-08 00:00:00',TIMESTAMP '2016-11-07 00:00:00',TIMESTAMP '2016-11-08 00:00:00',TIMESTAMP '2016-11-24 00:00:00',TIMESTAMP '2016-12-09 00:00:00',TIMESTAMP '2016-12-14 00:00:00',TIMESTAMP '2017-01-06 00:00:00',TIMESTAMP '2017-01-30 00:00:00',TIMESTAMP '2017-02-06 00:00:00',TIMESTAMP '2017-03-04 00:00:00',TIMESTAMP '2017-03-15 00:00:00',TIMESTAMP '2017-04-05 00:00:00',TIMESTAMP '2017-05-06 00:00:00',TIMESTAMP '2017-05-07 00:00:00',TIMESTAMP '2017-06-11 00:00:00',TIMESTAMP '2017-06-13 00:00:00',TIMESTAMP '2017-07-02 00:00:00',TIMESTAMP '2017-08-05 00:00:00',TIMESTAMP '2017-09-07 00:00:00',TIMESTAMP '2017-09-10 00:00:00',TIMESTAMP '2017-09-25 00:00:00',TIMESTAMP '2017-10-10 00:00:00',TIMESTAMP '2017-10-20 00:00:00',TIMESTAMP '2017-11-03 00:00:00',TIMESTAMP '2017-11-04 00:00:00',TIMESTAMP '2017-12-06 00:00:00',TIMESTAMP '2017-12-20 00:00:00',TIMESTAMP '2018-01-04 00:00:00',TIMESTAMP '2018-01-10 00:00:00',TIMESTAMP '2018-01-16 00:00:00',TIMESTAMP '2018-02-04 00:00:00',TIMESTAMP '2018-02-22 00:00:00',TIMESTAMP '2018-02-23 00:00:00',TIMESTAMP '2018-03-02 00:00:00',TIMESTAMP '2018-03-04 00:00:00',TIMESTAMP '2018-03-05 00:00:00',TIMESTAMP '2018-03-16 00:00:00',TIMESTAMP '2018-04-04 00:00:00',TIMESTAMP '2018-04-06 00:00:00',TIMESTAMP '2018-04-15 00:00:00',TIMESTAMP '2018-05-06 00:00:00',TIMESTAMP '2018-06-06 00:00:00',TIMESTAMP '2018-06-16 00:00:00',TIMESTAMP '2018-06-23 00:00:00',TIMESTAMP '2018-07-06 00:00:00'),
      load_dttm TIMESTAMP(0) NOT NULL COMPRESS (TIMESTAMP '2018-08-01 00:00:00'),
      extract_dttm TIMESTAMP(0) NOT NULL COMPRESS (TIMESTAMP '2018-06-18 00:00:00',TIMESTAMP '2018-07-06 00:00:00',TIMESTAMP '2018-07-07 00:00:00'),
      hash_val VARCHAR(32) CHARACTER SET LATIN)
UNIQUE PRIMARY INDEX ( tac_phone_cd,tac_parameter_cd );

COLLECT STATISTICS 
                   -- default SYSTEM SAMPLE PERCENT 
                   -- default SYSTEM THRESHOLD PERCENT 
            COLUMN ( tac_phone_cd,tac_parameter_cd ) , 
            COLUMN ( upd_dttm ) , 
            COLUMN ( tac_parameter_val ) , 
            COLUMN ( load_dttm ) , 
            COLUMN ( extract_dttm ) , 
            COLUMN ( tac_phone_cd ) , 
            COLUMN ( load_id ) , 
            COLUMN ( hash_val ) , 
            COLUMN ( ins_dttm ) , 
            COLUMN ( active_flag ) 
                ON EP_STG.DUP_TAC_PARAMETER ;
COLLECT STATISTICS 
             USING SAMPLE 10.00 PERCENT 
                   -- default SYSTEM THRESHOLD PERCENT 
            COLUMN ( tac_parameter_cd ) 
                ON EP_STG.DUP_TAC_PARAMETER ;


COMMENT ON TABLE EP_STG.DUP_TAC_PARAMETER is 'whatever';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.tac_phone_cd IS 'tac_phone_cd';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.tac_parameter_cd IS 'tac_parameter_cd';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.tac_parameter_val IS 'tac_parameter_val';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.upd_dttm IS 'Audit column - load date when the record was last updated (change on any column)';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.active_flag IS 'Audit column - load date when the record was last updated';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.load_id IS 'Audit column - load instance ID';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.ins_dttm IS 'Audit column - load date when the record was first inserted into STAGE';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.load_dttm IS 'Audit column - load date when the record was loaded';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.extract_dttm IS 'Audit column - date and time of extract';
COMMENT ON COLUMN EP_STG.DUP_TAC_PARAMETER.hash_val IS 'Audit column - MD5 hash for this record';


/*+
    --//---------------------------------
    --// Basic information
    --//---------------------------------
    +Stereotype          = 'Stage'
    +SrcEngineID         =  0
    +SrcStgSniffer       = 'ep_stg.stg_preproc.sniffer.pl'

    --//---------------------------------
    --// Alert zone and criticallity
    --//---------------------------------
    +SrcAlertZoneBegin   =  60
    +SrcAlertZoneEnd     =  130
    +SrcIsCritical       =  true

    +SrcToughness        =  'SMALL'

*/