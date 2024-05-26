USE dummy1;

---#### 11

SELECT j.FirstName AS JudgeName, j.LastName AS JudgeLastName, c.FirstName AS ChefName, c.LastName AS ChefLastName, SUM(s.Score) AS TotalRating FROM Score s JOIN Cook j ON s.JudgeID
    = j.CookID JOIN Cook c ON s.CookID = c.CookID GROUP BY s.JudgeID, s.CookID ORDER BY TotalRating DESC LIMIT 5;