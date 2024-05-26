USE dummy1;

----###4
SELECT c.FirstName, c.LastName
FROM Cook c
         LEFT JOIN Score s ON c.CookID = s.JudgeID
WHERE s.JudgeID IS NULL;