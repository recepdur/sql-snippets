WITH MyCTE
AS
(
    SELECT O.OrganizationId
    FROM Organization O WITH(NOLOCK)
    WHERE O.OrganizationId IN (SELECT Value FROM @DepartmentList)
 
    UNION ALL
 
    SELECT OSD.OrganizationId
    FROM OrganizationStructureDetail OSD WITH(NOLOCK)
        INNER JOIN MyCTE Mc ON OSD.OrganizationIdParent = Mc.OrganizationId
)
 
SELECT mcc.OrganizationId FROM MyCTE mcc
