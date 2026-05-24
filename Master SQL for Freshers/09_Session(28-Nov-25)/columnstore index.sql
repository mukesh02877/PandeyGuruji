

--columnstore index
/*
A column store index is an index that was designed mainly for improving the query performance for workloads with very
large amounts of data (eg. data warehouse fact tables).  This type of index stores the index data in a column based 
format rather than row based as is done with traditional indexes. */

Select * from DimCustomer

CREATE COLUMNSTORE INDEX IX_SalesOrderDetail_ProductIDOrderQty_ColumnStore
ON DimCustomer (CustomerKey,YearlyIncome);


SELECT CustomerKey,SUM(YearlyIncome)
FROM DimCustomer 
GROUP BY CustomerKey;