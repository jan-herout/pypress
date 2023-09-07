import sys
from pathlib import Path

import pytest

_test_dir = Path(__file__).parent
_root_dir = _test_dir.parent.parent / "src"
assert _root_dir.exists()
sys.path.insert(0, _root_dir)
from genpypress import app_to_async as pt


@pytest.fixture
def lnd_table() -> str:
    f = _test_dir / "fixtures" / "lnd_DUP_DEVICE_LIST.sql"
    return f.read_text(encoding="utf-8")


@pytest.fixture
def stg_table() -> str:
    f = _test_dir / "fixtures" / "stg_DUP_TAC_PARAMETER.sql"
    return f.read_text(encoding="utf-8")


def test_as_lnd(lnd_table: str):
    result1 = pt._as_lnd(lnd_table)
    result = pt._as_lnd(result1)
    assert isinstance(result, str)
    assert result == result1

    lines = result.split("\n")

    # na prvním řádku NESMÍ být databáze
    assert not lines[0].startswith("database")

    # název databáze NESMÍ být v názvu tabulky ani jinde
    assert "EP_LND" not in lines[1]
    assert "EP_LND" not in result

    # collect stats NESMÍ být v definici
    assert "COLLECT" not in result

    # job_id MUSÍ být v definici
    assert "job_id" in result

    # comment tabulky MUSÍ být v definici
    assert "COMMENT ON TABLE" in result

    # index MUSÍ být v definici
    assert "PRIMARY INDEX" in result

    # partition NESMÍ být v definici
    assert "PARTITION BY" not in result

    # tabulka přepsána na mutiset
    assert "MULTISET TABLE" in result


def test_as_stg(stg_table: str):
    # typ tbaulky je s (stav)
    def _typ_s(*args, **kwargs):
        return "s"

    result1 = pt._as_stg(stg_table, prompt_func=_typ_s)
    result = pt._as_stg(result1, prompt_func=_typ_s)
    assert isinstance(result, str)
    assert result == result1

    lines = result.split("\n")

    # na prvním řádku NESMÍ být databáze
    assert not lines[0].startswith("database")

    # název databáze NESMÍ být v názvu tabulky
    assert "EP_STG" not in lines[1]
    assert "EP_STG" not in result

    # collect stats NESMÍ být v definici
    assert "COLLECT" not in result

    # start_dttm MUSÍ být v definici
    assert "start_dttm" in result

    # comment tabulky MUSÍ být v definici
    assert "COMMENT ON TABLE" in result

    # index MUSÍ být v definici
    assert "PRIMARY INDEX" in result
