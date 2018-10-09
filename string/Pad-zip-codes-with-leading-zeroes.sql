SELECT LPAD(CAST(zipcode AS TEXT), 5, '0') AS zip
  FROM cd.members
 ORDER BY zip;
