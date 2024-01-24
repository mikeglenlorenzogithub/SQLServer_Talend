--CREATE PROCEDURE

CREATE PROCEDURE dbo.summary_order_status (
	@StatusID VARCHAR(50)
) AS
BEGIN
	SELECT a.OrderID, b.CustomerName, c.ProductName, a.Quantity, d.StatusOrder
	FROM FactSalesOrder as a
	INNER JOIN DimCustomer as b ON a.CustomerID = b.CustomerID
	INNER JOIN DimProduct as c ON a.ProductID = c.ProductID
	INNER JOIN DimStatusOrder as d ON a.StatusID = d.StatusID
	WHERE d.StatusID = @StatusID;
END;



--EXECUTE PROCEDURE

--EXEC DWH_Project.dbo.summary_order_status
--@StatusID = 1;

--EXEC DWH_Project.dbo.summary_order_status
--@StatusID = 2;

--EXEC DWH_Project.dbo.summary_order_status
--@StatusID = 3;