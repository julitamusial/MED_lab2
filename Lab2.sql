-- wyświetl nazwisko pracowników dla których region nie został zdefiniowany (znajdź informację o wartościach NULL i klauzuli WHERE) 
select LastName from Employees where Region is null;

-- wyświetl najdroższy i najtańszy produkt (tabela Products) (znajdź informację o funkcjach MAX i MIN oraz operatorze UNION oraz SELECT TOP);
Select ProductName, UnitPrice as 'min' from Products where UnitPrice = (Select min(UnitPrice) from Products)
Select ProductName, UnitPrice as 'max' from Products where UnitPrice = (Select max(UnitPrice) from Products)

Select ProductName, UnitPrice as 'cena' from Products where UnitPrice = (select min(UnitPrice) from Products) 
union
select ProductName, UnitPrice from Products where UnitPrice = (select max(UnitPrice) from Products)

-- wyświetl wszystkie produkty, których cena jednostkowa jest wyższa od średniej (znajdź informację o funkcji AVG); 
Select ProductName, UnitPrice from Products Where UnitPrice > (Select AVG(UnitPrice) from Products);

-- wyświetl sumę frachtu (freight) dla wszystkich zamówień (znajdź informację o funkcji SUM); 
Select SUM(Freight) as "Suma Frachtu" from Orders;

-- wyświetl średnią cenę produktu w zależności od kategorii (znajdź informację o klauzuli GROUP BY); 
Select CategoryID, AVG(UnitPrice) as 'srednia cena' from Products group by CategoryID;

-- wyświetl nazwy wszystkich klientów wraz z łączną sumą dokonanych przez nich transakcji (suma transakcji: unitPrice*Quantity- Discount)
Select CompanyName from Customers 
Union
Select OrderID, (UnitPrice*Quantity-Discount) as 'suma_transakcji' from OrderDetails;




