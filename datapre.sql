--Point the script to the right Database.
USE HOSPITALDWH;
GO

-- Create a view from the CleanData
CREATE OR ALTER VIEW v_HospitalAdmission AS
--Creating a CTE(temp) called 'CleanData' to hold all data in the database and identify duplicate
WITH CleanData AS(
-- Selecting all data and trying to find duplicates
SELECT *, 
	ROW_NUMBER() OVER( PARTITION BY MRD_No, D_O_A, D_O_D ORDER BY MRD_No) Dup_No
FROM Admissiondata
--ORDER BY MRD_No 
)
-- Selecting all data from the 
SELECT *
FROM CleanData
WHERE Dup_No = 1 AND MRD_No IS NOT NULL
--ORDER BY MRD_No 
