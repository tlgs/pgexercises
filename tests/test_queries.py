import psycopg
import pytest

from .data import PARAM_LIST


@pytest.fixture(scope="module")
def db_cursor():
    with psycopg.connect("dbname=exercises user=postgres") as conn:
        with conn.cursor() as cur:
            yield cur

    # automatic teardown


@pytest.mark.parametrize("query_path, columns, values", PARAM_LIST)
def test_query(db_cursor, query_path, columns, values):
    with open(f"solutions/{query_path}") as f:
        query = f.read()

    db_cursor.execute(query)

    assert [column_name for column_name, *_ in db_cursor.description] == columns
    assert db_cursor.fetchall() == values
