/*
==================================
Create Databases and schemas
==================================

Purpose:
Creates a new database named 'DataWareHouse' after checking if it alerady exists.If the db exists, dr0pped it and recreated it.
Additionally, set up 3 schemas within the the db called: "bronze", "silver" and "gold".

Warning:
Running this will drop the entire DB if it exists. All data will be permantly deleted. Proceed with precautions
and ensure you have propoer backups before running the script
*/


-- Create Database 'DataWareHouse'
USE master;
GO

--Drop and recreate the database if exists
IF EXISTS(SELECT 1 FROM sys.databases WHERE name='DataWareHouse')
BEGIN
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO

-- Create Database 
CREATE DATABASE DataWareHouse;

USE DataWareHouse;
GO
--Creating the schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
