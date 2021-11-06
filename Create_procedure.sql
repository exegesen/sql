IF (OBJECT_ID('dbo.create_user') IS NOT NULL ) 
   DROP PROCEDURE dbo.create_user
GO
CREATE PROCEDURE create_user 
	@CustomerID INT, 
	@Fname nvarchar(MAX),
	@Lname nvarchar(MAX),
	@Address nvarchar(MAX),
	@Postalcode nvarchar(MAX),
	@Phone nvarchar(MAX),
	@Email nvarchar(MAX)
AS
BEGIN
	INSERT INTO Customer
		(
			
			--name, 
			Fname,
			Lname,
			[Address],
			Postalcode,
			tfnnr,
			Email
		) 
	VALUES 
		(
			 
			--@Name, 
			@Fname,
			@Lname,
			@Address,
			@Postalcode,
			@Phone,
			@Email
		)
END;
EXEC create_user @Name = 'ExampleName'
-- change Name in customer to varchar(max)
ALTER TABLE Customer ALTER COLUMN Name varchar(max);
ALTER TABLE Customer ADD COLUMN 
SELECT * FROM Customer