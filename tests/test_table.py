import json
import pathlib
import sys

import cattr
import pytest

_UPDATE_GOLDE_FILE_ = False

_lib_dir = pathlib.Path(__file__).parent.parent / "src"
_fixtures_dir = pathlib.Path(__file__).parent / "fixtures"
sys.path.insert(0, str(_lib_dir))
from genpypress import table  # noqa: E402 - make flake8 happy


def test_from_file():
    fixture = _fixtures_dir / "test_from_file.sql"
    data = table.from_file(fixture)
    assert data
    assert isinstance(data, table.Table) == 1
    assert data.name == "SFA_GARANT_DN2"
    assert len(data.columns) == 36

    golden_file = _fixtures_dir / "test_from_file.golden.json"
    if _UPDATE_GOLDE_FILE_:
        golden_data = cattr.unstructure(data)
        golden_file.write_text(json.dumps(golden_data, indent=4))
    else:
        golden_data = json.loads(golden_file.read_text())
        got = cattr.unstructure(data)
        assert got == golden_data

    t = data
    assert t["llp_ico"].name == "llp_ico"
    assert t[0].name == "llp_ico"
    t["llp_ico"].compress = "'whatever'"
    assert t["llp_ico"].compress == "'whatever'"
    del t["llp_ico"]
    del t[0]  # account_id
    assert t[0].name == "PrimaryGarant"  # třetí sloupec
    assert len(t.pi_columns) == 0  # smazali jsme account_id, které je na primárním indexu => nemáme primární index


def test_from_file_dies():
    fixture = _fixtures_dir / "test_from_file1.sql"
    with pytest.raises(AssertionError):
        table.from_file(fixture)
