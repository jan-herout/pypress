import sys

_lib_dir = pathlib.Path(__file__).parent.parent / "src"
sys.path.insert(0, str(_lib_dir))

import pathlib  # noqa: E402 - make flake8 happy

from genpypress.table import Column, Table, from_file  # noqa: E402 - make flake8 happy


def test_table2():
    ddl = pathlib.Path(r"c:\BI_Domain\ProductionMaster\db\Teradata\DDL\EP_STG\Tables\BD_SCORE.sql")
    table = from_file(ddl)
    assert table.name == "BD_SCORE"
    assert table["ins_dttm"].data_type_base == "TIMESTAMP"
    assert table["ins_dttm"].data_type == "TIMESTAMP(6)"
    assert table.database == "EP_STG"
