--Pregunta 1: Número total de pedidos
SELECT COUNT(DISTINCT`Order ID`) AS pedidos_totales FROM `my-project-sql-500217.sales_analysis.superstore` ;
--Pregunta 2: Clientes únicos
SELECT COUNT(DISTINCT `Customer ID`) AS clientes_unicos FROM `my-project-sql-500217.sales_analysis.superstore`;
--Pregunta 3: Ventas y beneficio total
SELECT ROUND(SUM(Sales),2) AS ventas_totales ,ROUND(SUM(Profit),2) AS beneficio_total FROM `my-project-sql-500217.sales_analysis.superstore`;
--Pregunta 4: Top 10 clientes por compras
SELECT `Customer Name` AS clientes, ROUND(SUM(Sales),2) AS ventas
FROM `my-project-sql-500217.sales_analysis.superstore` 
GROUP BY `Customer Name`
ORDER BY ventas DESC
LIMIT 10;
--Pregunta 5: Categoría de cliente según ventas totales
WITH ventas_clientes AS (
  SELECT `Customer Name`, ROUND(SUM(Sales),2) AS ventas_totales
  FROM `my-project-sql-500217.sales_analysis.superstore`
  GROUP BY `Customer Name`)
SELECT `Customer Name`, ventas_totales,
CASE
    WHEN ventas_totales > 10000 THEN 'ORO'
    WHEN ventas_totales BETWEEN 5000 AND 10000 THEN 'PLATA'
    ELSE 'BRONZE'
  END AS categoria_cliente
FROM ventas_clientes
ORDER BY ventas_totales DESC;
--Pregunta 6: Margen de beneficio neto por categoría de producto
SELECT Category, 
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_neto,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS margen_beneficio
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY Category
ORDER BY margen_beneficio DESC;
--Pregunta 7: Top 5 productos más rentables
SELECT Category,
`Product Name` AS nombre_producto,
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_total
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY Category,`Product Name`
ORDER BY beneficio_total DESC
LIMIT 5;
--Pregunta 8: Comparativa de regiones por ventas, beneficio y margen de beneficio neto
SELECT Region,
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_total,
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS margen_beneficio
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY Region
ORDER BY ventas_totales DESC, beneficio_total DESC, margen_beneficio DESC;
--Pregunta 9: Subcategorías problematicas de productos en la Región Central
SELECT `Sub-Category`,
Category,
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_total,
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS margen_beneficio
FROM `my-project-sql-500217.sales_analysis.superstore`
WHERE Region = 'Central' 
GROUP BY `Sub-Category`, Category
ORDER BY margen_beneficio ASC;
--Pregunta 10: Ventas, beneficio y eficiencia por segmento de cliente
SELECT 
  Segment,
  ROUND(SUM(Sales), 2) AS ventas_totales,
  ROUND(SUM(Profit), 2) AS beneficio_total,
  ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS margen_beneficio
FROM my-project-sql-500217.sales_analysis.superstore
GROUP BY Segment
ORDER BY beneficio_total DESC;
--Pregunta 11 (A): Relación entre descuento y beneficio
SELECT CORR(Discount,Profit) AS correlacion 
FROM `my-project-sql-500217.sales_analysis.superstore`;
--Pregunta 11 (B): Ventas, beneficio y margen según descuentos aplicados
SELECT Discount, 
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_neto,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS margen_beneficio
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY Discount
ORDER BY Discount DESC;
--Pregunta 12: Decuentos aplicados por subcategoría de producto
SELECT Category, `Sub-Category`,Discount,
ROUND(SUM(Sales),2) AS ventas_totales,
ROUND(SUM(Profit),2) AS beneficio_neto,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS margen_beneficio
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY Category,`Sub-Category`, Discount
ORDER BY Discount DESC, margen_beneficio ASC;
--Pregunta 13: Ranking de clientes por beneficios y pérdidas (Limitados a 10)
SELECT `Customer Name`,
ROUND(SUM(Profit),2) AS beneficio_total,
DENSE_RANK() OVER(ORDER BY ROUND(SUM(Profit),2)DESC) AS ranking
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY `Customer Name`
LIMIT 10;
SELECT `Customer Name`, 
ROUND(SUM(Profit),2) AS beneficio_total,
DENSE_RANK() OVER(ORDER BY ROUND(SUM(Profit),2)ASC) AS ranking
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY `Customer Name`
LIMIT 10;
--Cálculos varios
SELECT * 
FROM `my-project-sql-500217.sales_analysis.superstore`
WHERE Sales IS NULL 
   OR Profit IS NULL 
   OR Discount IS NULL
   OR Sales = 0;

SELECT ROUND(AVG(Sales),2) AS media_ventas
FROM `my-project-sql-500217.sales_analysis.superstore`;
SELECT ROUND(SUM(Sales),2)/ROUND(COUNT(DISTINCT`Order ID`),2) AS ticket_medio
FROM `my-project-sql-500217.sales_analysis.superstore`;
SELECT Region, COUNT(DISTINCT Region) AS regiones
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY region;
SELECT `Sub-Category`, COUNT(DISTINCT `Sub-Category`) 
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY `Sub-Category`;
SELECT Segment, COUNT(DISTINCT `Segment`) 
FROM `my-project-sql-500217.sales_analysis.superstore`
GROUP BY `Segment`;

