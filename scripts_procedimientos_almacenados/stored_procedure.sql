USE [test]
GO

/****** Object:  StoredProcedure [dbo].[GetUserPermissions]    Script Date: 12/01/2025 07:39:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[GetUserPermissions]
    @EntityID INT,      
    @UserID INT    
AS
BEGIN
   SET ANSI_WARNINGS OFF;
    --PermiUser
    SELECT 
        'PermiUser' AS tabla,
        pu.Usercompany_id,
        pu.Permission_ID,
		pu.Entitycatalog_ID,
        p.Name,
        p.Can_Create,
        p.Can_Read,
        p.Can_Update,
        p.Can_Delete,
        p.Can_Import,
        p.Can_Export
    INTO #Permisos
    FROM PermiUser pu
    INNER JOIN Permission p ON pu.Permission_ID = p.id_permi
   /* WHERE pu.Usercompany_id = @UserID
      AND pu.Entitycatalog_ID = @EntityID;*/;

    --PermiRole
    INSERT INTO #Permisos
    SELECT 
        'PermiRole' AS tabla,
        pr.Role_ID,
        pr.Permission_ID,
		pr.Entitycatalog_ID,
        p.Name,
        p.Can_Create,
        p.Can_Read,
        p.Can_Update,
        p.Can_Delete,
        p.Can_Import,
        p.Can_Export
    FROM PermiRole pr
    INNER JOIN Permission p ON pr.Permission_ID = p.id_permi
    --WHERE (pr.Entitycatalog_ID IS NULL OR pr.Entitycatalog_ID = @EntityID);

    --PermiUserRecord
    INSERT INTO #Permisos
    SELECT 
        'PermiUserRecord' AS tabla,
        pur.Usercompany_ID,
        pur.Permission_ID,
		pur.Entitycatalog_ID,
        p.Name,
        p.Can_Create,
        p.Can_Read,
        p.Can_Update,
        p.Can_Delete,
        p.Can_Import,
        p.Can_Export
    FROM PermiUserRecord pur
    INNER JOIN Permission p ON pur.Permission_ID = p.id_permi
  --  WHERE pur.Usercompany_ID = @UserID
  --    AND pur.Entitycatalog_ID = @EntityID;
  ;
    --PermiRoleRecord
    INSERT INTO #Permisos
    SELECT 
        'PermiRoleRecord' AS tabla,
        prr.id_perrc,
        prr.Permission_ID,
		prr.Entitycatalog_ID,
        p.Name,
        p.Can_Create,
        p.Can_Read,
        p.Can_Update,
        p.Can_Delete,
        p.Can_Import,
        p.Can_Export
    FROM PermiRoleRecord prr
    INNER JOIN Permission p ON prr.Permission_ID = p.id_permi
    --WHERE  prr.Entitycatalog_ID = @EntityID;
	;
	--consulto tabla permisos
    SELECT 
        /*tabla,
        ID_user,
        Role_ID,
        Permission_ID,
		Entitycatalog_ID,
        Name,
        MAX(Can_Create) AS Can_Create,
        MAX(Can_Read) AS Can_Read,
        MAX(Can_Update) AS Can_Update,
        MAX(Can_Delete) AS Can_Delete,
        MAX(Can_Import) AS Can_Import,
        MAX(Can_Export) AS Can_Export*/*
    FROM #Permisos
    --GROUP BY tabla, id_user, Role_ID, Permission_ID, Name
   -- ORDER BY tabla, Permission_ID;

    -- Limpiar la tabla temporal
    DROP TABLE #Permisos;
END
GO


