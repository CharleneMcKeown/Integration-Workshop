SELECT [value] FROM OPENJSON(
  (SELECT
    id = o.OrderID,
    (select OrderDetailId, ProductId, Quantity from OrderDetails od where od.OrderId = o.OrderId for json auto) as OrderDetails
   FROM Orders o FOR JSON PATH)
)