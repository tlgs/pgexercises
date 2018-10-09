SELECT memid,
       REGEXP_REPLACE(telephone, '[^0-9]', '', 'g') as telephone
  FROM cd.members;
