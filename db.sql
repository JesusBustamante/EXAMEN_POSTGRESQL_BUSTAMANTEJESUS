-- TABLES

CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE proveedores (
    proveedor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 5,
	stock_maximo INT NOT NULL DEFAULT 20,
    categoria_id INT REFERENCES categorias(categoria_id),
    proveedor_id INT REFERENCES proveedores(proveedor_id),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    compras_totales INT DEFAULT 0
);

CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    estado VARCHAR(20) DEFAULT 'completada' CHECK (estado IN ('completada', 'cancelada', 'pendiente'))
);

CREATE TABLE detalle_ventas (
    detalle_id SERIAL PRIMARY KEY,
    venta_id INT REFERENCES ventas(venta_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

CREATE TABLE compras_proveedores (
    compra_id SERIAL PRIMARY KEY,
    proveedor_id INT REFERENCES proveedores(proveedor_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    productos TEXT,
    observaciones TEXT
);