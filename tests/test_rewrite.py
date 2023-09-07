import pathlib
import sys

_lib_dir = pathlib.Path(__file__).parent.parent / "src"
sys.path.insert(0, str(_lib_dir))
from genpypress import app_rewrite as app  # noqa: E402 - make flake8 happy


def test_rewrite():
    config = app.Rule(
        where="anywhere",
        rules=[
            app.Rewrite(old_val="from", new_val="to"),
        ],
    )

    content = "replace from"
    wanted = "replace to"
    replaced = app.rewrite_text(content, config.rules)
    assert replaced == wanted
