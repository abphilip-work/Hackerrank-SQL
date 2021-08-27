-- https://www.hackerrank.com/challenges/contest-leaderboard/problem

SELECT H.HACKER_ID, NAME, SUM(SCORE) AS TOTAL_SCORE
FROM HACKERS AS H INNER JOIN 
(SELECT HACKER_ID, MAX(SCORE) AS SCORE FROM SUBMISSIONS 
GROUP BY CHALLENGE_ID, HACKER_ID) SUB
ON H.HACKER_ID = SUB.HACKER_ID 
GROUP BY H.HACKER_ID, NAME HAVING TOTAL_SCORE>0
ORDER BY TOTAL_SCORE DESC, HACKER_ID