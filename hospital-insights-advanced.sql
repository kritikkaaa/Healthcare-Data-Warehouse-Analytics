-- Hospital Bed Occupancy Rate
-- Measures bed utilization efficiency over the study period.
-- Calculates the ratio of occupied bed-days to total available
-- bed-days, expressed as a percentage.
-- SQL Concepts: DATEDIFF, Aggregate Functions, CAST, ROUND

DECLARE @TOTALBEDS INT = 200;

DECLARE @PERIOD INT;

SELECT @PERIOD =
DATEDIFF(DAY, MIN(D_O_A), MAX(D_O_D))
FROM V_HOSPITALADMISSION;

DECLARE @OCCUPIED_BED_DAYS INT;

SELECT @OCCUPIED_BED_DAYS =
SUM(DURATION_OF_STAY)
FROM V_HOSPITALADMISSION;

DECLARE @AVAILABLE_BED_DAYS INT;

SELECT @AVAILABLE_BED_DAYS =
@TOTALBEDS * @PERIOD;

SELECT 
    @OCCUPIED_BED_DAYS AS OCCUPIED_BED_DAYS,
    @AVAILABLE_BED_DAYS AS AVAILABLE_BED_DAYS,

    ROUND(
        CAST(@OCCUPIED_BED_DAYS AS FLOAT)
        /
        CAST(@AVAILABLE_BED_DAYS AS FLOAT)
        * 100,
    2) AS BED_OCCUPANCY_RATE;


-- Month-over-Month (MoM) Admission Growth Analysis
-- Tracks monthly admission volumes and calculates MoM
-- growth rate to identify seasonal trends and demand patterns.
-- SQL Concepts: CTE, Window Functions, LAG(), FORMAT, Aggregation, Trend Analysis

WITH Monthly AS (
    SELECT
        FORMAT(D_O_A,'yyyy-MM') AS Yr_Month,
        COUNT(*) AS Admissions
    FROM v_HospitalAdmission
    GROUP BY FORMAT(D_O_A,'yyyy-MM')
)

SELECT
    Yr_Month,
    Admissions,
    LAG(Admissions) OVER(ORDER BY Yr_Month) AS Prev_Month,
    ROUND(
        (
            (
                Admissions
                - LAG(Admissions) OVER(ORDER BY Yr_Month)
            ) * 1.0
            /
            LAG(Admissions) OVER(ORDER BY Yr_Month)
        ) * 100.0,
    2
    ) AS  MoM_Growth_Percentage
FROM Monthly;


-- Length of Stay (LOS) Outlier Detection
-- Identifies patients whose length of stay exceeds 2 standard deviations above
-- the hospital average, flagging abnormally long stays for clinical and financial review.
-- SQL Concepts: CTE, STDEV(), AVG(), CROSS JOIN, Z-Score Calculation, NULLIF()

WITH Stats AS (
  SELECT
    AVG(CAST(DURATION_OF_STAY AS FLOAT))
      AS Avg_LOS,
    STDEV(DURATION_OF_STAY) AS SD_LOS
  FROM v_HospitalAdmission
)
SELECT  
  MRD_No, AGE, GENDER,
  DURATION_OF_STAY,
  ROUND(s.Avg_LOS, 1) AS Avg_LOS,
  ROUND((DURATION_OF_STAY - s.Avg_LOS)
    / NULLIF(s.SD_LOS,0), 2) AS Z_Score
FROM v_HospitalAdmission
CROSS JOIN Stats s
WHERE DURATION_OF_STAY >
  s.Avg_LOS + (2 * s.SD_LOS)
ORDER BY DURATION_OF_STAY DESC;
