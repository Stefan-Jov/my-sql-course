SELECT 
    PatientId, 
    AdmittedDate,
    DischargeDate,
    DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthOfStay,
    DATEADD(WEEK, -2, AdmittedDate) AS ReminderDate,
    DATEADD(MONTH, 3, DischargeDate) AS AppointmentDate,
    Hospital,
    Ward,
    Tariff
FROM PatientStay
WHERE Hospital IN ('Kingston','PRUH')
-- ORDER BY Hospital, Ward, Tariff DESC
ORDER BY PatientId DESC

-- AND Ward IN ('Day Surgery','General Surgery')
-- AND AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
-- AND Tariff >= 6
--AND Ward = 'Dermatology'

SELECT
    Hospital
    ,Ward
    ,COUNT(*) AS 'Number of Patients'
    ,SUM(Tariff) AS 'Total Tariff'
FROM
    PatientStay
GROUP BY Hospital, Ward

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,dh.Hospital
    ,dh.HospitalType
    ,dh.HospitalSize
FROM
    PatientStay ps
    FULL OUTER JOIN DimHospitalBad dh ON ps.Hospital = dh.Hospital