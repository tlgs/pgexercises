import psycopg
import pytest

from data import test_parameters


@pytest.fixture(scope="module")
def db_cursor():
    try:
        with psycopg.connect("host=localhost dbname=exercises user=postgres") as conn:
            with conn.cursor() as cur:
                yield cur

        # automatic teardown

    except psycopg.OperationalError:
        pytest.exit("cannot reach database")


@pytest.mark.parametrize(
    "query_path, columns, values",
    test_parameters,
    ids=(p.values[0] for p in test_parameters),
)
def test_query(db_cursor, query_path, columns, values):
    with open(f"solutions/{query_path}") as f:
        query = f.read()

    db_cursor.execute(query)

    assert [column_name for column_name, *_ in db_cursor.description] == columns
    assert db_cursor.fetchall() == values
