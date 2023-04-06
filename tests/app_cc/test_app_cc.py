import pathlib
import sys
from unittest import mock

_src_dir = pathlib.Path(__file__).parent.parent.parent / "src"
sys.path.insert(0, _src_dir)
from genpypress import app_cc


def test_load_script():
    """test that script is loaded without the header and the footer which enables conditional create"""
    # given mock file, which can be read (.read)
    input_content = _mock_with_cc()
    mock_read = mock.MagicMock(name="mock file", **{"read.return_value": input_content})
    # given mock open builtin
    patch_open = mock.MagicMock(name="patched open")
    patch_open.return_value.__enter__.return_value = mock_read

    # when the file is loaded
    with mock.patch("builtins.open", patch_open):
        output_content = app_cc._load_script(file=mock_read, input_encoding="utf-8")

    # then the file is loaded without the header and footer
    assert "conditional_create" in input_content
    assert ".LABEL" in input_content
    assert ".LABEL" not in output_content
    assert "conditional_create" not in output_content, f"{output_content = }"


def _mock_with_cc() -> str:
    return """
-----------------------------------------------------------------------
/*--conditional_create--*/
select count(*) from dbc.tablesV 
where tablename='RMCA_ZBALSAP_LOG' and databasename=( select database )
having count(*) > 0;

.IF ERRORCODE <> 0 THEN .QUIT 10;
.IF ACTIVITYCOUNT = 0 THEN .GOTO TABLE_DOES_NOT_EXIST;
.REMARK 'tabulka EXISTUJE, drop'
drop table RMCA_ZBALSAP_LOG;

.LABEL TABLE_DOES_NOT_EXIST
-----------------------------------------------------------------------
/* NO_WORKSPACE */
create multiset table RMCA_ZBALSAP_LOG (
      FILE_NAME VARCHAR(1024) CHARACTER SET LATIN NOT NULL
)
PRIMARY INDEX ( FILE_NAME );

.LABEL KONEC
"""
