database EP_LND;

CREATE SET TABLE EP_LND.DUP_DEVICE_LIST ,FALLBACK ,
     MAP = TD_MAP1
     (
      msisdn VARCHAR(30) CHARACTER SET UNICODE NOT NULL,
      phone_cd VARCHAR(100) CHARACTER SET UNICODE,
      imei VARCHAR(30) CHARACTER SET UNICODE,
      first_apperance_date DATE FORMAT 'YYYY-MM-DD',
      last_confirm_date DATE FORMAT 'YYYY-MM-DD',
      load_id INTEGER NOT NULL,
      extract_dttm TIMESTAMP(0) NOT NULL,
      hash_val VARCHAR(32) CHARACTER SET LATIN)
PRIMARY INDEX ( msisdn )
PARTITION BY RANGE_N(CAST((extract_dttm ) AS DATE AT TIME ZONE 'Europe Central') BETWEEN DATE - 10  AND DATE + 5  EACH INTERVAL '1' DAY, NO RANGE, UNKNOWN);

COLLECT STATISTICS 
                   -- default SYSTEM SAMPLE PERCENT 
                   -- default SYSTEM THRESHOLD PERCENT 
            COLUMN ( PARTITION ) , 
            COLUMN ( msisdn ) 
                ON EP_LND.DUP_DEVICE_LIST ;


COMMENT ON TABLE EP_LND.DUP_DEVICE_LIST IS 'information about mobile devices. Combination of MSISDN and device type is exported.';

COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.msisdn IS 'msisdn';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.phone_cd IS 'phone_cd';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.imei IS 'International Mobile Equipment Identity';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.first_apperance_date IS 'First IMEI activation in O2 network';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.last_confirm_date IS 'Datum posledního zaznamenání dané vazby MSISDN-IMEI';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.load_id IS 'Audit column - load instance ID';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.extract_dttm IS 'Audit column - date and time of extract';
COMMENT ON COLUMN EP_LND.DUP_DEVICE_LIST.hash_val IS 'Audit column - MD5 hash for this record';


/*+
    --//---------------------------------
    --// Basic information
    --//---------------------------------
    +Stereotype          = 'Landing'
    +SrcEngineID         =  1
    +SrcSourceSystem     =  'DUP'
    +SrcTypeOfExtract    =  'DELIMITED'
    +SrcExtractCharSet   =  'UTF-8'
    +SrcFieldDelimiter   =  '09'

    --//---------------------------------
    --// Type of validator used
    --//---------------------------------
    +SrcTypeOfMask       =  'aCRM'
    
    --//---------------------------------
    --// Alert zone and criticallity
    --//---------------------------------
    +SrcAlertZoneBegin   =  120
    +SrcAlertZoneEnd     =  180
    +SrcIsCritical       =  true
    
    --//---------------------------------
    --// Naming convention
    --//    HINT: if SrcDatFileExtension and SrcLogFileExtension are used,
    --//          do not include them in regexes below.
    --//    HINT: next few lines are a "single line magical comment" BY DESIGN!
    --//---------------------------------
*/
    --+ +SrcLogFileAvailable =  true
    --+ +SrcDatFileExtension =  '.DAT'
    --+ +SrcLogFileExtension =  '.LOG'
    --+ +SrcFileMask         =  'DUPER_DEVICE_LIST_[YYYY][MM][DD]_[0-9]{3}'
    --+ +SrcExtractDttmMask  =  'DUPER_DEVICE_LIST_([YYYY])([MM])([DD])_[0-9]{3}/$1-$2-$3 00:00:00'
    --+ +SrcLoadInitMask     =  'DUPER_DEVICE_LIST_[YYYY][MM][DD]_000\.LOG'
    
    --+ +SrcToughness        =  'SMALL'


/*+

    --//---------------------------------
    --// column extensions
    --//---------------------------------
    +column.msisdn.Primary = true
    +column.first_apperance_date.EtlSrcFormat = 'YYYY-MM-DD'
    +column.last_confirm_date.EtlSrcFormat = 'YYYY-MM-DD'

*/