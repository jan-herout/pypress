import pathlib
import sys
import json
import cattrs

_lib_dir = pathlib.Path(__file__).parent.parent / "src"
sys.path.insert(0, str(_lib_dir))
from genpypress import mapping


def test_mapping():
    x = mapping.Mapping(model="TGT", data_source="STG", name="MAP_NAME", table="PARTY")
    assert x


def test_filter_keep_code():
    input_lines = """    
    everything labeled by plus sign is considered code and should by part of output

    ```
    + here is the code
    + continue
    ```

    another comment

    ```
    + code continues
    + and continues
    ```
    """.split(
        "\n"
    )
    got = mapping.filter_keep_code(input_lines)
    wanted_lines = [line for line in input_lines if line.strip().startswith("+")]
    assert got == wanted_lines


def test_filter_keep_code_throws():
    input_lines = ["```", "..."]
    raised = False
    try:
        mapping.filter_keep_code(input_lines)
    except mapping.ParsingError:
        raised = True
    assert raised, "expected the code to die"


def test_is_in_square_brackets():
    input_line = " [ table = test ] "
    ctx = mapping._is_in_square_brackets(input_line)
    assert ctx, "this should NOT be none"
    assert ctx.key == "TABLE"
    assert ctx.val == "test"


def test_full():
    in_str = r"""
    # Mapping 
    ```
    [ model = EP_TGT ]
    [ data_source = BSCS ]
    [ table = ACCS_METH_NA_DRCTN ]
    [ mapping = TGT_ACCS_METH_NA_DRCTN_010_MPUZPTAB_BSCS ]

    TO2_PDM_EDW.ETL_Loaded_From = C:\BI_DOMAIN\DEVELOPMENT\RFC_31325_CIS_100900_SOC\20_DEV\20_MAPPING\L30_EDW_LOAD_033_NA_DRCTN\TD_FULL_EP_TGT_033_NA_DRCTN_JD.XLS
    TO2_PDM_EDW.ETL_Facet = L30_EDW_LOAD_033_NA_DRCTN
    ```
    
    ```sql
    select * from test
    ```

    ## RMS

    ```
    TO2_PDM_EDW.RMS_TD_Full = TD_full_NA_Drctn.xls
    ```


    ## Table mapping 

    ```
    mapped_to = BSCS_ZONE_DEST_PNTS_MPUZPTAB, SK_ACCS_METH, SK_NA_DRCTN, ACCS_METH_STAT

    comment = ->
        Cílem mapování je mít otevřenou relaci mezi ACCS_METH (z MPUZPTAB) a NA_DIRCTN, kdy ACCS_METH není ve stavu neaktivním (4)
        V případě že je ACCS_METH ve stavu neaktivním, je třeba relaci uzavřít (nastavit end_dttm na ACCS_METH_STAT.end_dttm posledního "aktivního" záznamu) 
        V rámci dané accs_meth_na_drctn_role_id nesmí dojít v daném čase k vazbě 1:N (ACCS_METH:NA_DRCTN)
    <-

    TO2_PDM_EDW.ETL_Historization = SCD25v2I
    TO2_PDM_EDW.ETL_Matching_Rules = accs_meth_id, accs_meth_na_drctn_role_id
    TO2_PDM_EDW.ETL_Main_Source = BSCS_ZONE_DEST_PNTS_MPUZPTAB

    TO2_PDM_EDW.ETL_Referenced_Sources = ->
        /* TGT */
        INNER JOIN SK_ACCS_METH
        ON REGEXP_REPLACE(BSCS_ZONE_DEST_PNTS_MPUZPTAB.digits_, '\+', '', 1, 1, 'i') = SK_ACCS_METH.src_cd
        AND SK_ACCS_METH.key_dom_id = $$SK_ACCS_METH#JP11  /* BSCS-MPUZPTAB digits_ */
        
        LEFT OUTER JOIN SK_NA_DRCTN
        ON TRIM(TRAILING '.' FROM CAST(BSCS_ZONE_DEST_PNTS_MPUZPTAB.ZPCODE AS VARCHAR(100))) = SK_NA_DRCTN.src_cd 
        AND SK_NA_DRCTN.key_dom_id = $$SK_NA_DRCTN#JP22  /* BSCS-MPUZPTAB ZPCODE */
        
        INNER JOIN ACCS_METH_STAT
        ON SK_ACCS_METH.accs_meth_id = ACCS_METH_STAT.accs_meth_id
        AND ACCS_METH_STAT.end_dttm = CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP(6))
    <-


    TO2_PDM_EDW.ETL_Filter_Criterion = ->
        BSCS_ZONE_DEST_PNTS_MPUZPTAB.upd_dttm = $$LOAD_DTTM
        AND BSCS_ZONE_DEST_PNTS_MPUZPTAB.digits_ LIKE '+%'
    <-

    TO2_PDM_EDW.ETL_Transformation_Algorithm = QUALIFY ROW_NUMBER() OVER (PARTITION BY BSCS_ZONE_DEST_PNTS_MPUZPTAB.digits_ ORDER BY BSCS_ZONE_DEST_PNTS_MPUZPTAB.load_id ASC, BSCS_ZONE_DEST_PNTS_MPUZPTAB.zpcode desc ) = 1

    TO2_PDM_EDW.ETL_Transformation_Rules = ->
        /*Active Flag Manipulation*/
        CASE 
        WHEN ACCS_METH_STAT.stat_type_id = 4 /* DEACTIVATED */ 
            THEN '0' /* active flag set to 0 */
        ELSE '1'
        END AS active_flag
    <-

    TO2_PDM_EDW.ETL_Calendar = WR001007E
    ```

    ## Column mapping

    **accs_meth_id**
    ```
    [ column = accs_meth_id ]
    comment = None
    mapped_to = BSCS_ZONE_DEST_PNTS_MPUZPTAB.digits_
    TO2_PDM_EDW.ETL_Transformation_Rules = BSCS_ZONE_DEST_PNTS_MPUZPTAB.digits_ => SK_ACCS_METH.accs_meth_id
    ```

    **start_dttm**
    ```
    [ column = start_dttm ]
    comment = None
    mapped_to = None

    TO2_PDM_EDW.ETL_Transformation_Rules = ->
        CASE
        WHEN $$LOAD_DTTM = $$SOC_CUTOVER_DTTM THEN $$MIN_DTTM
        ELSE $$LOAD_DTTM
        END
    <-

    ```    

    **end_dttm**
    ```
    [ column = end_dttm ]
    comment = None
    mapped_to = None
    TO2_PDM_EDW.ETL_Transformation_Rules = $$MAX_DTTM
    ```

    **na_drctn_id**
    ```
    [ column = na_drctn_id ]
    # datový typ, storno
    comment = None
    mapped_to = BSCS_ZONE_DEST_PNTS_MPUZPTAB.ZPCODE
    TO2_PDM_EDW.ETL_Transformation_Rule = BSCS_ZONE_DEST_PNTS_MPUZPTAB.ZPCODE => SK_NA_DRCTN.na_drctn_id
    ```

    **accs_meth_na_drctn_role_id**
    ```
    [ column = accs_meth_na_drctn_role_id ]
    comment = Doplnit číselník Accs_meth_na_drctn_role
    mapped_to = None
    TO2_PDM_EDW.ETL_Transformation_Rules = 2
    ```

    **hist_type**
    ```
    [ column = hist_type ]
    mapped_to = .
    TO2_PDM_EDW.ETL_Transformation_Rules = 250200010
    ```


    **map_id**
    ```
    [ column = map_id ]
    comment = None
    mapped_to = None
    TO2_PDM_EDW.ETL_Transformation_Rules = 110001310
    ```

    ```
    [ rule = test ]
    ```

    # Parse errors
    
    ```
    stop here
    ```

    
    """
    m = mapping.from_markdown(in_str)
    assert m.name == "TGT_ACCS_METH_NA_DRCTN_010_MPUZPTAB_BSCS"
    assert m.data_source == "BSCS"
    assert m.model == "EP_TGT"
    assert m.table == "ACCS_METH_NA_DRCTN"
    assert m["map_id"].transformation_rule == "110001310"
    throwed = False
    try:
        x = m["neexistujici sloupec"]
    except KeyError:
        throwed = True
    assert throwed
