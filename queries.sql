-- Consultas Avanzadas

-- 1. Listar los productos con stock menor a 5 unidades
select * from productos where stock < 5;

-- 2.  Calcular ventas totales de un mes específico
select EXTRACT(MONTH FROM fecha) as mes, count(*)
from ventas
where EXTRACT(MONTH FROM fecha) = 5
group by mes;

-- 3. Obtener el cliente con más compras realizadas.
select * from clientes 
order by compras_totales desc 
limit 1;

-- 4.  Listar los 5 productos más vendidos
select p.producto_id, p.nombre as Producto, sum(dv.cantidad) as Unidades_vendidas
from detalle_ventas dv
join productos p on dv.producto_id = p.producto_id
group by p.producto_id, p.nombre
order by Unidades_vendidas desc
limit 5;

-- 5.  Consultar ventas realizadas en un rango de fechas de tres Días y un Mes

-- 3 dias
select v.venta_id, c.nombre as Nombre_cliente, c.apellido as Apellido_cliente, v.fecha, v.total 
from ventas v
join clientes c on v.cliente_id = c.cliente_id
where v.fecha >= CURRENT_DATE - INTERVAL '3 days'
and v.fecha < CURRENT_DATE + INTERVAL '1 day'
group by v.venta_id, c.nombre, c.apellido, v.fecha, v.total
order by v.fecha desc;

-- 1 mes
select v.venta_id, c.nombre as Nombre_cliente, c.apellido as Apellido_cliente, v.fecha, v.total 
from ventas v
join clientes c on v.cliente_id = c.cliente_id
where v.fecha >= CURRENT_DATE - INTERVAL '1 month'
and v.fecha < CURRENT_DATE + INTERVAL '1 day'
group by v.venta_id, c.nombre, c.apellido, v.fecha, v.total
order by v.fecha desc;

-- 6.  Identificar clientes que no han comprado en los últimos 6 meses
select c.cliente_id, c.nombre, c.apellido, c.email, c.telefono, max(v.fecha) as ultima_compra, current_date - max(v.fecha)::date as dias_inactivo
from clientes c
join ventas v on c.cliente_id = v.cliente_id
group by c.cliente_id, c.nombre, c.apellido, c.email, c.telefono
having max(v.fecha) is null or max(v.fecha) < current_date - interval '6 months'
order by dias_inactivo desc nulls first;