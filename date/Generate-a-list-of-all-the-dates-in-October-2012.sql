SELECT GENERATE_SERIES(TIMESTAMP '2012-10-01',
                       TIMESTAMP '2012-10-31',
                       INTERVAL '1 DAY') AS ts;
