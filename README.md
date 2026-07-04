# Superstore Análisis

## Objetivo

Analizar las ventas, beneficios, clientes, productos y regiones de una empresa retail utilizando SQL en BigQuery.

## Herramientas utilizadas

- SQL
- Google BigQuery
- GitHub

## Preguntas analizadas

1. Número total de pedidos
2. Clientes únicos
3. Ventas y beneficio total
4. Top 10 clientes por ventas
5. Categoría de cliente según ventas (Segmentación de clientes)
6. Margen de beneficio neto por categoría de producto
7. Top 5 Productos más rentables
8. Compativa de regiones por ventas, beneficio y Margen de beneficio neto
9. Subcategorías problematicas de productos en la región Central
10. Ventas, beneficios y eficiencia por segmento de clientes
11. Relación entre descuento y beneficio. Ventas, beneficios y Margen según descuentos
12. Descuentos aplicados por Subcategorias de productos
13. Ranking de clientes según beneficios y pérdidas
14. Hallazgos
15. Recomendaciones

## SQL Conceptos Usados

- Agregaciones (SUM, COUNT, AVG)
- GROUP BY
- ORDER BY
- CASE WHEN
- CTE
- Window Functions (RANK)

## Descubrimiento de los problemas principales

- El riesgo de los productos con altos costes base
- La aplicación de descuentos agresivos e indiscriminados
- La ineficiencia operativa de la región Central

## Recomendaciones

- Regular la política de descuentos máximos
- Vincular los descuentos comerciales al margen estructural de cada producto
- Auditoría comercial y plan de choque en la región Central


## KPI de seguimiento

-El descuento medio aplicado en subcategorías críticas.
-El Margen de beneficio global de la región Central (buscando elevarlo del 7.92% al 13%).
-La eliminación de márgenes negativos por transacción.

## Archivos

- queries.sql
- Informe PDF
