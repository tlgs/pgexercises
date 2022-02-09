import datetime

import pytest

fromisoformat = datetime.datetime.fromisoformat


PARAMS = [
    pytest.param(
        "1-basic/01-Retrieve-everything-from-a-table.sql",
        ["facid", "name", "membercost", "guestcost", "initialoutlay", "monthlymaintenance"],
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
    ),
    pytest.param(
        "1-basic/03-Control-which-rows-are-retrieved.sql",
        ["facid", " name", " membercost", " guestcost", " initialoutlay", " monthlymaintenance"],
        [
            (0, b"Tennis Court 1", 5, 25, 10000, 200),
            (1, b"Tennis Court 2", 5, 25, 8000, 200),
            (4, b"Massage Room 1", 35, 80, 4000, 3000),
            (5, b"Massage Room 2", 35, 80, 4000, 3000),
            (6, b"Squash Court", 3.5, 17.5, 5000, 80),
        ],
    ),
    pytest.param(
        "1-basic/04-Control-which-rows-are-retrieved-part-2.sql",
        ["facid", "name", "membercost", "monthlymaintenance"],
        [(4, b"Massage Room 1", 35, 3000), (5, b"Massage Room 2", 35, 3000)],
    ),
    pytest.param(
        "1-basic/05-Basic-string-searches.sql",
        ["facid", "name", "membercost", "guestcost", "initialoutlay", "monthlymaintenance"],
        [
            (0, b"Tennis Court 1", 5, 25, 10000, 200),
            (1, b"Tennis Court 2", 5, 25, 8000, 200),
            (3, b"Table Tennis", 0, 5, 320, 10),
        ],
    ),
    pytest.param(
        "1-basic/06-Matching-against-multiple-possible-values.sql",
        ["facid", "name", "membercost", "guestcost", "initialoutlay", "monthlymaintenance"],
        [(1, b"Tennis Court 2", 5, 25, 8000, 200), (5, b"Massage Room 2", 35, 80, 4000, 3000)],
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
    ),
    pytest.param(
        "1-basic/08-Working-with-dates.sql",
        ["memid", "surname", "firstname", "joindate"],
        [
            (24, b"Sarwin", b"Ramnaresh", fromisoformat("2012-09-01 08:44:42")),
            (26, b"Jones", b"Douglas", fromisoformat("2012-09-02 18:43:05")),
            (27, b"Rumney", b"Henrietta", fromisoformat("2012-09-05 08:42:35")),
            (28, b"Farrell", b"David", fromisoformat("2012-09-15 08:22:05")),
            (29, b"Worthington-Smyth", b"Henry", fromisoformat("2012-09-17 12:27:15")),
            (30, b"Purview", b"Millicent", fromisoformat("2012-09-18 19:04:01")),
            (33, b"Tupperware", b"Hyacinth", fromisoformat("2012-09-18 19:32:05")),
            (35, b"Hunt", b"John", fromisoformat("2012-09-19 11:32:45")),
            (36, b"Crumpet", b"Erica", fromisoformat("2012-09-22 08:36:38")),
            (37, b"Smith", b"Darren", fromisoformat("2012-09-26 18:08:45")),
        ],
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
    ),
    pytest.param(
        "1-basic/11-Simple-aggregation.sql",
        ["latest"],
        [(fromisoformat("2012-09-26 18:08:45"),)],
    ),
    pytest.param(
        "1-basic/12-More-aggregation.sql",
        ["firstname", "surname", "joindate"],
        [(b"Darren", b"Smith", fromisoformat("2012-09-26 18:08:45"))],
    ),
    pytest.param(
        "2-joins-and-subqueries/1-Retrieve-the-start-times-of-members-bookings.sql",
        ["starttime"],
        [
            (fromisoformat("2012-09-18 09:00:00"),),
            (fromisoformat("2012-09-18 17:30:00"),),
            (fromisoformat("2012-09-18 13:30:00"),),
            (fromisoformat("2012-09-18 20:00:00"),),
            (fromisoformat("2012-09-19 09:30:00"),),
            (fromisoformat("2012-09-19 15:00:00"),),
            (fromisoformat("2012-09-19 12:00:00"),),
            (fromisoformat("2012-09-20 15:30:00"),),
            (fromisoformat("2012-09-20 11:30:00"),),
            (fromisoformat("2012-09-20 14:00:00"),),
            (fromisoformat("2012-09-21 10:30:00"),),
            (fromisoformat("2012-09-21 14:00:00"),),
            (fromisoformat("2012-09-22 08:30:00"),),
            (fromisoformat("2012-09-22 17:00:00"),),
            (fromisoformat("2012-09-23 08:30:00"),),
            (fromisoformat("2012-09-23 17:30:00"),),
            (fromisoformat("2012-09-23 19:00:00"),),
            (fromisoformat("2012-09-24 08:00:00"),),
            (fromisoformat("2012-09-24 16:30:00"),),
            (fromisoformat("2012-09-24 12:30:00"),),
            (fromisoformat("2012-09-25 15:30:00"),),
            (fromisoformat("2012-09-25 17:00:00"),),
            (fromisoformat("2012-09-26 13:00:00"),),
            (fromisoformat("2012-09-26 17:00:00"),),
            (fromisoformat("2012-09-27 08:00:00"),),
            (fromisoformat("2012-09-28 11:30:00"),),
            (fromisoformat("2012-09-28 09:30:00"),),
            (fromisoformat("2012-09-28 13:00:00"),),
            (fromisoformat("2012-09-29 16:00:00"),),
            (fromisoformat("2012-09-29 10:30:00"),),
            (fromisoformat("2012-09-29 13:30:00"),),
            (fromisoformat("2012-09-29 14:30:00"),),
            (fromisoformat("2012-09-29 17:30:00"),),
            (fromisoformat("2012-09-30 14:30:00"),),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/2-Work-out-the-start-times-of-bookings-for-tennis-courts.sql",
        ["start", "name"],
        [
            (fromisoformat("2012-09-21 08:00:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 08:00:00"), b"Tennis Court 2"),
            (fromisoformat("2012-09-21 09:30:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 10:00:00"), b"Tennis Court 2"),
            (fromisoformat("2012-09-21 11:30:00"), b"Tennis Court 2"),
            (fromisoformat("2012-09-21 12:00:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 13:30:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 14:00:00"), b"Tennis Court 2"),
            (fromisoformat("2012-09-21 15:30:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 16:00:00"), b"Tennis Court 2"),
            (fromisoformat("2012-09-21 17:00:00"), b"Tennis Court 1"),
            (fromisoformat("2012-09-21 18:00:00"), b"Tennis Court 2"),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/3-Produce-a-list-of-all-members-who-have-recommended-another-member.sql",
        ["firstname", "surname"],
        [
            (b"Florence", b"Bader"),
            (b"Timothy", b"Baker"),
            (b"Gerald", b"Butters"),
            (b"Jemima", b"Farrell"),
            (b"Matthew", b"Genting"),
            (b"David", b"Jones"),
            (b"Janice", b"Joplette"),
            (b"Millicent", b"Purview"),
            (b"Tim", b"Rownam"),
            (b"Darren", b"Smith"),
            (b"Tracy", b"Smith"),
            (b"Ponder", b"Stibbons"),
            (b"Burton", b"Tracy"),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/3-Produce-a-list-of-all-members-who-have-recommended-another-member.sql",
        ["firstname", "surname"],
        [
            (b"Florence", b"Bader"),
            (b"Timothy", b"Baker"),
            (b"Gerald", b"Butters"),
            (b"Jemima", b"Farrell"),
            (b"Matthew", b"Genting"),
            (b"David", b"Jones"),
            (b"Janice", b"Joplette"),
            (b"Millicent", b"Purview"),
            (b"Tim", b"Rownam"),
            (b"Darren", b"Smith"),
            (b"Tracy", b"Smith"),
            (b"Ponder", b"Stibbons"),
            (b"Burton", b"Tracy"),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/4-Produce-a-list-of-all-members-along-with-their-recommender.sql",
        ["memfname", "memsname", "recfname", "recsname"],
        [
            (b"Florence", b"Bader", b"Ponder", b"Stibbons"),
            (b"Anne", b"Baker", b"Ponder", b"Stibbons"),
            (b"Timothy", b"Baker", b"Jemima", b"Farrell"),
            (b"Tim", b"Boothe", b"Tim", b"Rownam"),
            (b"Gerald", b"Butters", b"Darren", b"Smith"),
            (b"Joan", b"Coplin", b"Timothy", b"Baker"),
            (b"Erica", b"Crumpet", b"Tracy", b"Smith"),
            (b"Nancy", b"Dare", b"Janice", b"Joplette"),
            (b"David", b"Farrell", None, None),
            (b"Jemima", b"Farrell", None, None),
            (b"GUEST", b"GUEST", None, None),
            (b"Matthew", b"Genting", b"Gerald", b"Butters"),
            (b"John", b"Hunt", b"Millicent", b"Purview"),
            (b"David", b"Jones", b"Janice", b"Joplette"),
            (b"Douglas", b"Jones", b"David", b"Jones"),
            (b"Janice", b"Joplette", b"Darren", b"Smith"),
            (b"Anna", b"Mackenzie", b"Darren", b"Smith"),
            (b"Charles", b"Owen", b"Darren", b"Smith"),
            (b"David", b"Pinker", b"Jemima", b"Farrell"),
            (b"Millicent", b"Purview", b"Tracy", b"Smith"),
            (b"Tim", b"Rownam", None, None),
            (b"Henrietta", b"Rumney", b"Matthew", b"Genting"),
            (b"Ramnaresh", b"Sarwin", b"Florence", b"Bader"),
            (b"Darren", b"Smith", None, None),
            (b"Darren", b"Smith", None, None),
            (b"Jack", b"Smith", b"Darren", b"Smith"),
            (b"Tracy", b"Smith", None, None),
            (b"Ponder", b"Stibbons", b"Burton", b"Tracy"),
            (b"Burton", b"Tracy", None, None),
            (b"Hyacinth", b"Tupperware", None, None),
            (b"Henry", b"Worthington-Smyth", b"Tracy", b"Smith"),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/5-Produce-a-list-of-all-members-who-have-used-a-tennis-court.sql",
        ["member", "facility"],
        [
            (b"Anne Baker", b"Tennis Court 1"),
            (b"Anne Baker", b"Tennis Court 2"),
            (b"Burton Tracy", b"Tennis Court 1"),
            (b"Burton Tracy", b"Tennis Court 2"),
            (b"Charles Owen", b"Tennis Court 1"),
            (b"Charles Owen", b"Tennis Court 2"),
            (b"Darren Smith", b"Tennis Court 2"),
            (b"David Farrell", b"Tennis Court 1"),
            (b"David Farrell", b"Tennis Court 2"),
            (b"David Jones", b"Tennis Court 1"),
            (b"David Jones", b"Tennis Court 2"),
            (b"David Pinker", b"Tennis Court 1"),
            (b"Douglas Jones", b"Tennis Court 1"),
            (b"Erica Crumpet", b"Tennis Court 1"),
            (b"Florence Bader", b"Tennis Court 1"),
            (b"Florence Bader", b"Tennis Court 2"),
            (b"GUEST GUEST", b"Tennis Court 1"),
            (b"GUEST GUEST", b"Tennis Court 2"),
            (b"Gerald Butters", b"Tennis Court 1"),
            (b"Gerald Butters", b"Tennis Court 2"),
            (b"Henrietta Rumney", b"Tennis Court 2"),
            (b"Jack Smith", b"Tennis Court 1"),
            (b"Jack Smith", b"Tennis Court 2"),
            (b"Janice Joplette", b"Tennis Court 1"),
            (b"Janice Joplette", b"Tennis Court 2"),
            (b"Jemima Farrell", b"Tennis Court 1"),
            (b"Jemima Farrell", b"Tennis Court 2"),
            (b"Joan Coplin", b"Tennis Court 1"),
            (b"John Hunt", b"Tennis Court 1"),
            (b"John Hunt", b"Tennis Court 2"),
            (b"Matthew Genting", b"Tennis Court 1"),
            (b"Millicent Purview", b"Tennis Court 2"),
            (b"Nancy Dare", b"Tennis Court 1"),
            (b"Nancy Dare", b"Tennis Court 2"),
            (b"Ponder Stibbons", b"Tennis Court 1"),
            (b"Ponder Stibbons", b"Tennis Court 2"),
            (b"Ramnaresh Sarwin", b"Tennis Court 1"),
            (b"Ramnaresh Sarwin", b"Tennis Court 2"),
            (b"Tim Boothe", b"Tennis Court 1"),
            (b"Tim Boothe", b"Tennis Court 2"),
            (b"Tim Rownam", b"Tennis Court 1"),
            (b"Tim Rownam", b"Tennis Court 2"),
            (b"Timothy Baker", b"Tennis Court 1"),
            (b"Timothy Baker", b"Tennis Court 2"),
            (b"Tracy Smith", b"Tennis Court 1"),
            (b"Tracy Smith", b"Tennis Court 2"),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/6-Produce-a-list-of-costly-bookings.sql",
        ["member", "facility", "cost"],
        [
            (b"GUEST GUEST", b"Massage Room 2", 320),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Tennis Court 2", 150),
            (b"Jemima Farrell", b"Massage Room 1", 140),
            (b"GUEST GUEST", b"Tennis Court 1", 75),
            (b"GUEST GUEST", b"Tennis Court 2", 75),
            (b"GUEST GUEST", b"Tennis Court 1", 75),
            (b"Matthew Genting", b"Massage Room 1", 70),
            (b"Florence Bader", b"Massage Room 2", 70),
            (b"GUEST GUEST", b"Squash Court", 70),
            (b"Jemima Farrell", b"Massage Room 1", 70),
            (b"Ponder Stibbons", b"Massage Room 1", 70),
            (b"Burton Tracy", b"Massage Room 1", 70),
            (b"Jack Smith", b"Massage Room 1", 70),
            (b"GUEST GUEST", b"Squash Court", 35),
            (b"GUEST GUEST", b"Squash Court", 35),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/7-Produce-a-list-of-all-members-along-with-their-recommender-using-no-joins.sql",
        ["member", "recommender"],
        [
            (b"Anna Mackenzie", b"Darren Smith"),
            (b"Anne Baker", b"Ponder Stibbons"),
            (b"Burton Tracy", None),
            (b"Charles Owen", b"Darren Smith"),
            (b"Darren Smith", None),
            (b"David Farrell", None),
            (b"David Jones", b"Janice Joplette"),
            (b"David Pinker", b"Jemima Farrell"),
            (b"Douglas Jones", b"David Jones"),
            (b"Erica Crumpet", b"Tracy Smith"),
            (b"Florence Bader", b"Ponder Stibbons"),
            (b"GUEST GUEST", None),
            (b"Gerald Butters", b"Darren Smith"),
            (b"Henrietta Rumney", b"Matthew Genting"),
            (b"Henry Worthington-Smyth", b"Tracy Smith"),
            (b"Hyacinth Tupperware", None),
            (b"Jack Smith", b"Darren Smith"),
            (b"Janice Joplette", b"Darren Smith"),
            (b"Jemima Farrell", None),
            (b"Joan Coplin", b"Timothy Baker"),
            (b"John Hunt", b"Millicent Purview"),
            (b"Matthew Genting", b"Gerald Butters"),
            (b"Millicent Purview", b"Tracy Smith"),
            (b"Nancy Dare", b"Janice Joplette"),
            (b"Ponder Stibbons", b"Burton Tracy"),
            (b"Ramnaresh Sarwin", b"Florence Bader"),
            (b"Tim Boothe", b"Tim Rownam"),
            (b"Tim Rownam", None),
            (b"Timothy Baker", b"Jemima Farrell"),
            (b"Tracy Smith", None),
        ],
    ),
    pytest.param(
        "2-joins-and-subqueries/8-Produce-a-list-of-costly-bookings-using-a-subquery.sql",
        ["member", "facility", "cost"],
        [
            (b"GUEST GUEST", b"Massage Room 2", 320),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Massage Room 1", 160),
            (b"GUEST GUEST", b"Tennis Court 2", 150),
            (b"Jemima Farrell", b"Massage Room 1", 140),
            (b"GUEST GUEST", b"Tennis Court 1", 75),
            (b"GUEST GUEST", b"Tennis Court 2", 75),
            (b"GUEST GUEST", b"Tennis Court 1", 75),
            (b"Matthew Genting", b"Massage Room 1", 70),
            (b"Florence Bader", b"Massage Room 2", 70),
            (b"GUEST GUEST", b"Squash Court", 70),
            (b"Jemima Farrell", b"Massage Room 1", 70),
            (b"Ponder Stibbons", b"Massage Room 1", 70),
            (b"Burton Tracy", b"Massage Room 1", 70),
            (b"Jack Smith", b"Massage Room 1", 70),
            (b"GUEST GUEST", b"Squash Court", 35),
            (b"GUEST GUEST", b"Squash Court", 35),
        ],
    ),
]
