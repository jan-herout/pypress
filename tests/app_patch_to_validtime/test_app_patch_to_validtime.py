import sys
from pathlib import Path
import pytest

_test_dir = Path(__file__).parent
_root_dir = _test_dir.parent.parent / "src"
assert _root_dir.exists()
sys.path.insert(0, _root_dir)
from genpypress import app_patch_to_validtime as pt


@pytest.fixture()
def fix_ok_tpt():
    return (_test_dir / "fixtures" / "ok.tpt").read_text(encoding="utf-8")


@pytest.fixture()
def fix_bad_tpt():
    return (_test_dir / "fixtures" / "bad.tpt").read_text(encoding="utf-8")


@pytest.fixture()
def fix_result_tpt():
    return (_test_dir / "fixtures" / "result.tpt").read_text(encoding="utf-8")


def test_tpt_line_with_insert__success(fix_ok_tpt):
    lineno = pt.tpt_line_with_insert(fix_ok_tpt.split("\n"))
    assert lineno == 31


def test_tpt_line_with_insert__failure(fix_bad_tpt):
    with pytest.raises(pt.PatchError):
        pt.tpt_line_with_insert(fix_bad_tpt.split("\n"))


def test_tpt_line_with_to_operator__success(fix_ok_tpt):
    lineno = pt.tpt_line_with_to_operator(fix_ok_tpt.split("\n"))
    assert lineno == 53


def test_tpt_line_with_to_operator__failure(fix_bad_tpt):
    with pytest.raises(pt.PatchError):
        pt.tpt_line_with_to_operator(fix_bad_tpt.split("\n"))


def test_tpt_line_with_semicolon_above_operator__success(fix_ok_tpt):
    lineno = pt.tpt_line_with_to_operator(fix_ok_tpt.split("\n"))
    assert lineno == 53
    tup = pt.tpt_line_with_semicolon_above_operator(fix_ok_tpt.split("\n"), lineno)
    assert tup.line_no == 51
    assert tup.offset == 1


def test_tpt_line_with_apply__success(fix_ok_tpt):
    lineno = pt.tpt_line_with_apply(fix_ok_tpt.split("\n"))
    assert lineno == 27


def test_tpt_line_with_apply__failure(fix_bad_tpt):
    with pytest.raises(pt.PatchError):
        pt.tpt_line_with_apply(fix_bad_tpt.split("\n"))


def test_tpt_line_with_set_session():
    # TODO - tohle můžu otestovat nad patched obsahem, nechce se mi dělat pro to fixture
    ...


def tpt_line_with_restart_param():
    # TODO - tohle můžu otestovat nad patched obsahem, nechce se mi dělat pro to fixture
    ...


def test_patch_text(fix_ok_tpt, fix_result_tpt):
    new_text = pt._patch_text(fix_ok_tpt)
    assert new_text == fix_result_tpt


def test_tpt_is_first_select_star():
    lines = ["sss", "SELECT  * FROM"]
    assert pt.tpt_is_first_select_star(lines)


def test_tpt_is_first_select_star_negative():
    lines = ["sss", "select whatever FROM"]
    assert pt.tpt_is_first_select_star(lines) is False
