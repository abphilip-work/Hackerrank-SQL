-- https://www.hackerrank.com/challenges/challenges/problem
-- MS SQL

WITH SUB(ID, NAME, COUNTER) AS 
(SELECT C.HACKER_ID, H.NAME, COUNT(C.HACKER_ID) FROM CHALLENGES C INNER JOIN HACKERS H 
ON C.HACKER_ID = H.HACKER_ID GROUP BY C.HACKER_ID, H.NAME)

SELECT ID, NAME, COUNTER FROM SUB
WHERE COUNTER = (SELECT MAX(COUNTER) FROM SUB)
OR COUNTER IN (SELECT COUNTER FROM SUB GROUP BY COUNTER HAVING COUNT(COUNTER)=1)
ORDER BY COUNTER DESC, ID;