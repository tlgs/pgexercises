import datetime

import psycopg
import pytest

fromisoformat = datetime.datetime.fromisoformat


@pytest.fixture()
def db_cursor(scope="module"):
    with psycopg.connect("dbname=exercises user=postgres") as conn:
        with conn.cursor() as cur:
            yield cur

    # automatic teardown


@pytest.mark.parametrize(
    "query_path, columns, values",
    [
        pytest.param(
            "1-basic/01-Retrieve-everything-from-a-table.sql",
            [
                "facid",
                "name",
                "membercost",
                "guestcost",
                "initialoutlay",
                "monthlymaintenance",
            ],
            [
                (0, b"Tennis Court 1", 5, 25, 10000, 200),
                (1, b"Tennis Court 2", 5, 25, 8000, 200),
                (2, b"Badminton Court", 0, 15.5, 4000, 50),
                (3, b"Table Tennis", 0, 5, 320, 10),
                (4, b"Massage Room 1", 35, 80, 4000, 3000),
                (5, b"Massage Room 2", 35, 80, 4000, 3000),
                (6, b"Squash Court", 3.5, 17.5, 5000, 80),
                (7, b"Snooker Table", 0, 5, 450, 15),
                (8, b"Pool Table", 0, 5, 400, 15),
            ],
            id="1-basic/01-Retrieve-everything-from-a-table.sql",
        ),
        pytest.param(
            "1-basic/02-Retrieve-specific-columns-from-a-table.sql",
            ["name", "membercost"],
            [
                (b"Tennis Court 1", 5),
                (b"Tennis Court 2", 5),
                (b"Badminton Court", 0),
                (b"Table Tennis", 0),
                (b"Massage Room 1", 35),
                (b"Massage Room 2", 35),
                (b"Squash Court", 3.5),
                (b"Snooker Table", 0),
                (b"Pool Table", 0),
            ],
            id="1-basic/02-Retrieve-specific-columns-from-a-table.sql",
        ),
        pytest.param(
            "1-basic/03-Control-which-rows-are-retrieved.sql",
            [
                "facid",
                "name",
                "membercost",
                "guestcost",
                "initialoutlay",
                "monthlymaintenance",
            ],
            [
                (0, b"Tennis Court 1", 5, 25, 10000, 200),
                (1, b"Tennis Court 2", 5, 25, 8000, 200),
                (4, b"Massage Room 1", 35, 80, 4000, 3000),
                (5, b"Massage Room 2", 35, 80, 4000, 3000),
                (6, b"Squash Court", 3.5, 17.5, 5000, 80),
            ],
            id="1-basic/03-Control-which-rows-are-retrieved.sql",
        ),
        pytest.param(
            "1-basic/04-Control-which-rows-are-retrieved-part-2.sql",
            ["facid", "name", "membercost", "monthlymaintenance"],
            [
                (4, b"Massage Room 1", 35, 3000),
                (5, b"Massage Room 2", 35, 3000),
            ],
            id="1-basic/04-Control-which-rows-are-retrieved-part-2.sql",
        ),
        pytest.param(
            "1-basic/05-Basic-string-searches.sql",
            [
                "facid",
                "name",
                "membercost",
                "guestcost",
                "initialoutlay",
                "monthlymaintenance",
            ],
            [
                (0, b"Tennis Court 1", 5, 25, 10000, 200),
                (1, b"Tennis Court 2", 5, 25, 8000, 200),
                (3, b"Table Tennis", 0, 5, 320, 10),
            ],
            id="1-basic/05-Basic-string-searches.sql",
        ),
        pytest.param(
            "1-basic/06-Matching-against-multiple-possible-values.sql",
            [
                "facid",
                "name",
                "membercost",
                "guestcost",
                "initialoutlay",
                "monthlymaintenance",
            ],
            [
                (1, b"Tennis Court 2", 5, 25, 8000, 200),
                (5, b"Massage Room 2", 35, 80, 4000, 3000),
            ],
            id="1-basic/06-Matching-against-multiple-possible-values.sql",
        ),
        pytest.param(
            "1-basic/07-Classify-results-into-buckets.sql",
            ["name", "cost"],
            [
                (b"Tennis Court 1", b"expensive"),
                (b"Tennis Court 2", b"expensive"),
                (b"Badminton Court", b"cheap"),
                (b"Table Tennis", b"cheap"),
                (b"Massage Room 1", b"expensive"),
                (b"Massage Room 2", b"expensive"),
                (b"Squash Court", b"cheap"),
                (b"Snooker Table", b"cheap"),
                (b"Pool Table", b"cheap"),
            ],
            id="1-basic/07-Classify-results-into-buckets.sql",
        ),
        pytest.param(
            "1-basic/08-Working-with-dates.sql",
            ["memid", "surname", "firstname", "joindate"],
            [
                (24, b"Sarwin", b"Ramnaresh", fromisoformat("2012-09-01 08:44:42")),
                (26, b"Jones", b"Douglas", fromisoformat("2012-09-02 18:43:05")),
                (27, b"Rumney", b"Henrietta", fromisoformat("2012-09-05 08:42:35")),
                (28, b"Farrell", b"David", fromisoformat("2012-09-15 08:22:05")),
                (
                    29,
                    b"Worthington-Smyth",
                    b"Henry",
                    fromisoformat("2012-09-17 12:27:15"),
                ),
                (30, b"Purview", b"Millicent", fromisoformat("2012-09-18 19:04:01")),
                (33, b"Tupperware", b"Hyacinth", fromisoformat("2012-09-18 19:32:05")),
                (35, b"Hunt", b"John", fromisoformat("2012-09-19 11:32:45")),
                (36, b"Crumpet", b"Erica", fromisoformat("2012-09-22 08:36:38")),
                (37, b"Smith", b"Darren", fromisoformat("2012-09-26 18:08:45")),
            ],
            id="1-basic/08-Working-with-dates.sql",
        ),
        pytest.param(
            "1-basic/09-Removing-duplicates-and-ordering-results.sql",
            ["surname"],
            [
                (b"Bader",),
                (b"Baker",),
                (b"Boothe",),
                (b"Butters",),
                (b"Coplin",),
                (b"Crumpet",),
                (b"Dare",),
                (b"Farrell",),
                (b"GUEST",),
                (b"Genting",),
            ],
            id="1-basic/09-Removing-duplicates-and-ordering-results.sql",
        ),
        pytest.param(
            "1-basic/10-Combining-results-from-multiple-queries.sql",
            ["surname"],
            [
                (b"Hunt",),
                (b"Farrell",),
                (b"Tennis Court 2",),
                (b"Table Tennis",),
                (b"Dare",),
                (b"Rownam",),
                (b"GUEST",),
                (b"Badminton Court",),
                (b"Smith",),
                (b"Tupperware",),
                (b"Owen",),
                (b"Worthington-Smyth",),
                (b"Butters",),
                (b"Rumney",),
                (b"Tracy",),
                (b"Crumpet",),
                (b"Purview",),
                (b"Massage Room 2",),
                (b"Sarwin",),
                (b"Baker",),
                (b"Pool Table",),
                (b"Snooker Table",),
                (b"Jones",),
                (b"Coplin",),
                (b"Mackenzie",),
                (b"Boothe",),
                (b"Joplette",),
                (b"Stibbons",),
                (b"Squash Court",),
                (b"Tennis Court 1",),
                (b"Pinker",),
                (b"Genting",),
                (b"Bader",),
                (b"Massage Room 1",),
            ],
            id="1-basic/10-Combining-results-from-multiple-queries.sql",
        ),
        pytest.param(
            "1-basic/11-Simple-aggregation.sql",
            ["latest"],
            [(fromisoformat("2012-09-26 18:08:45"),)],
            id="1-basic/11-Simple-aggregation.sql",
        ),
        pytest.param(
            "1-basic/12-More-aggregation.sql",
            ["firstname", "surname", "joindate"],
            [(b"Darren", b"Smith", fromisoformat("2012-09-26 18:08:45"))],
            id="1-basic/12-More-aggregation.sql",
        ),
    ],
)
def test_query(db_cursor, query_path, columns, values):
    with open(f"solutions/{query_path}") as f:
        query = f.read()

    db_cursor.execute(query)

    assert [column_name for column_name, *_ in db_cursor.description] == columns
    assert db_cursor.fetchall() == values
