;WITH PersonnelCTE AS
(
   SELECT *, ROW_NUMBER() OVER (PARTITION BY DepartmentCode ORDER BY ActivationDate DESC) AS rn
   FROM Personnel AS P WITH(NOLOCK)
)  
 
SELECT * FROM PersonnelCTE WHERE rn = 1
