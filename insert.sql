-- INSERTS

INSERT INTO categorias (nombre, descripcion) VALUES
('Electrónica', 'Dispositivos electrónicos y gadgets'),
('Computación', 'Equipos de computo y accesorios'),
('Audio', 'Equipos de audio y sonido'),
('Smartphones', 'Teléfonos inteligentes y tablets'),
('Componentes', 'Partes y piezas para computadoras');

INSERT INTO proveedores (nombre, contacto, telefono, email, direccion) VALUES
('TechSupplies Inc.', 'Juan Pérez', '555-100-2000', 'juan@techsupplies.com', 'Av. Tecnológica 123, CDMX'),
('ElectroParts', 'María González', '555-200-3000', 'ventas@electroparts.mx', 'Calle Circuito 45, Guadalajara'),
('Global Gadgets', 'Robert Johnson', '555-300-4000', 'robert@globalgadgets.com', 'Boulevard Digital 78, Monterrey'),
('CompuMundo', 'Laura Sánchez', '555-400-5000', 'laura@compumundo.com.mx', 'Chipset 56, Puebla'),
('AudioTech', 'Carlos Ruiz', '555-500-6000', 'carlos@audiotech.mx', 'Sonido 22, Querétaro');

INSERT INTO productos (nombre, descripcion, precio, stock, stock_minimo, stock_maximo, categoria_id, proveedor_id) VALUES
('Laptop EliteBook X1', 'Laptop empresarial 15.6" i7 16GB RAM, 512GB SSD', 22499.00, 12, 5, 25, 2, 1),
('Smartphone Galaxy S23', 'Teléfono 6.1" 128GB, cámara triple, 5G', 17999.00, 18, 8, 30, 4, 3),
('Auriculares Sony WH-1000XM5', 'Audífonos inalámbricos con cancelación de ruido premium', 6999.00, 7, 3, DEFAULT, 3, 5),
('Tarjeta Gráfica NVIDIA RTX 4070', '12GB GDDR6X, DLSS 3, ray tracing', 15999.00, 5, 2, 15, 5, 2),
('Monitor LG UltraGear 32"', 'QHD 165Hz, 1ms, HDR10, NVIDIA G-Sync', 12999.00, 9, 4, 20, 1, 4);

INSERT INTO productos (nombre, descripcion, precio, stock, stock_minimo, stock_maximo, categoria_id, proveedor_id) VALUES
('Monitor Samsumg 32"', 'QHD 165Hz, 1ms, HDR10, NVIDIA G-Sync', 12999.00, 3, 4, 20, 1, 4);

INSERT INTO clientes (nombre, apellido, email, telefono, direccion) VALUES
('Ana', 'Martínez', 'ana.martinez@email.com', '555-111-2222', 'Calle Flores 123, CDMX'),
('Luis', 'Gómez', 'luis.gomez@correo.com', '555-222-3333', 'Av. Central 456, Guadalajara'),
('Sofía', 'Rodríguez', 'sofia.r@mail.com', '555-333-4444', 'Jardines 789, Monterrey'),
('Pedro', 'Hernández', 'pedro.h@dominio.com', '555-444-5555', 'Pinos 321, Puebla'),
('Marta', 'Díaz', 'marta.diaz@email.com', '555-555-6666', 'Cactus 654, Querétaro');

INSERT INTO clientes (nombre, apellido, email, telefono, direccion, fecha_registro, compras_totales) VALUES
('Jesus', 'Bustamante', 'jesusgustamante08@email.com', '315-661-1676', 'Buenos Aires, Medellin', '2025-02-14', 9);

INSERT INTO ventas (cliente_id, fecha, total) VALUES
(1, '2023-05-10 10:30:00', 27998.00),
(2, '2023-05-11 14:15:00', 8999.00),
(3, '2023-05-12 16:45:00', 10497.00),
(4, '2023-05-13 11:20:00', 2998.00),
(5, '2023-05-14 09:10:00', 18999.00);

INSERT INTO ventas (cliente_id, fecha, total) VALUES
(1, '2025-03-10 10:30:00', 25598.00),
(2, '2025-04-09 14:20:00', 8239.00),
(3, '2025-01-12 16:25:00', 93285.00),
(4, '2025-02-13 11:50:00', 1150.00);

INSERT INTO ventas (cliente_id, fecha, total) VALUES
(2, '2025-03-12 14:20:00', 8239.00);
INSERT INTO detalle_ventas (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 18999.00), 
(1, 3, 2, 1499.00),  
(2, 2, 1, 8999.00), 
(3, 4, 1, 15999.00),
(3, 5, 1, 8999.00),
(4, 3, 2, 1499.00), 
(5, 1, 1, 18999.00); 

INSERT INTO compras_proveedores (proveedor_id, fecha, total, productos, observaciones) VALUES
(1, '2023-04-01 09:00:00', 75996.00, '20 Laptop EliteBook', 'Pedido trimestral'),
(2, '2023-04-05 10:30:00', 31998.00, '2 Tarjeta Gráfica RTX 3080', 'Reposición stock'),
(3, '2023-04-10 11:15:00', 44995.00, '5 Smartphone X10', 'Promoción especial'),
(4, '2023-04-15 14:00:00', 17998.00, '2 Monitor 27" 4K', 'Pedido urgente'),
(5, '2023-04-20 16:45:00', 29980.00, '20 Auriculares BT-200', 'Compra mayorista');