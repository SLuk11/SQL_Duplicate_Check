CREATE PROCEDURE [dbo].[SP_DuplCheck](
@code varchar(2))

AS
BEGIN
	
	DECLARE @dupl_count	int

	SET @dupl_count = (SELECT Count(code) FROM [LSP_Shipment].[dbo].[ms_shipment_type] 
						WHERE [code] = @code);
	
	INSERT INTO ms_shipment_type(id, code, name)
	VALUES (@dupl_count+1, @code, 'testname' )

END;
GO
