<?php
class SQL
{
    public static function selectProductos()
    {
        return "
            SELECT
                producto.*,
                categoria.nombre AS categoriaNombre,
                (SELECT
                    COUNT(comentario.id)
                FROM
                    comentario
                WHERE
                    comentario.producto = producto.id) AS cantComentarios,
                (SELECT
                    COUNT(calificacion.id)
                FROM
                    calificacion
                WHERE
                    calificacion.producto = producto.id) AS cantCalificaciones,
                (SELECT
                    IFNULL(SUM(calificacion.valor),0)
                FROM
                    calificacion
                WHERE
                    calificacion.producto = producto.id) AS sumaCalificaciones
            FROM
                producto,
                categoria
            WHERE
                categoria.id = producto.categoria
            ORDER BY
                categoriaNombre,
                producto.nombre";
    }

    public static function selectProducto($id)
    {
        return"
            SELECT producto.*, categoria.nombre AS categoriaNombre
			  	FROM producto, categoria
				WHERE producto.id = ".$id." AND categoria.id = producto.categoria";
    }

    public static function selectStockProducto($id)
    {
        return "
            SELECT stock FROM producto WHERE id=".$id;
    }

    public static function reducirStockProducto($id,$cantidad)
    {
        return "
            UPDATE producto SET stock = stock - ".$cantidad." WHERE id=".$id;
    }

    public static function insertCompra($cliente)
    {
        return "
            INSERT INTO compra(cliente,fechahora) VALUES (".$cliente.",now())";
    }

    public static function selectIdNuevaCompra()
    {
        return "
            SELECT LAST_INSERT_ID()";
    }

    public static function selectCompras()
    {
        return "
            SELECT
                compra.id, compra.fechahora,
                CONCAT(usuario.nombres,' ',usuario.apellido1,' ',usuario.apellido2) as cliente,
                SUM(detalle.cantidad) AS cantidadProductos,
                SUM(detalle.cantidad*detalle.precio) AS total
            FROM
                compra, usuario, detalle
            WHERE
                detalle.compra = compra.id AND
                usuario.id = compra.cliente
            GROUP BY
                compra.id";
    }

    public static function insertDetalleCompra($compra,$producto,$cantidad,$precio)
    {
        return "
            INSERT INTO detalle(compra,producto,cantidad,precio)
                VALUES (".$compra.",".$producto.",".$cantidad.",".$precio.")";
    }

    public static function selectUsuario($rut)
    {
        return "
            SELECT 
                usuario.*,
                CONCAT(usuario.nombres,' ',usuario.apellido1,' ',usuario.apellido2) AS nombreCompleto
            FROM
                usuario
            WHERE
                rut=".$rut;
    }

    public static function selectUsuarios()
    {
        return "
            SELECT usuario.*,
                CONCAT(usuario.nombres,' ',usuario.apellido1,' ',usuario.apellido2) as nombreCompleto,
                CONCAT(usuario.direccion,', ',comuna.nombre,', ',region.nombre) AS direccionCompleta
                FROM usuario, comuna, region
                WHERE comuna.id = usuario.comuna AND region.id = comuna.region
                ORDER BY usuario.rut";
    }

    public static function countUsuario($rut)
    {
        return "
            SELECT COUNT(*) AS cantidad FROM usuario WHERE rut=".$rut;
    }

    public static function insertUsuario($usuario)
    {
        return "
            INSERT INTO
                usuario(rut,tipo,password,nombres,apellido1,apellido2,direccion,comuna,email)
            VALUES (
                $usuario->rut,
                '$usuario->tipo',
                '".password_hash($usuario->password,PASSWORD_DEFAULT)."',
                '$usuario->nombres',
                '$usuario->apellido1',
                '$usuario->apellido2',
                '$usuario->direccion',
                $usuario->comuna,
                '$usuario->email')";
    }

    public static function selectDetalle($idCompra)
    {
        return "
            SELECT
                detalle.id AS id,
                producto.nombre AS productoNombre,
                detalle.cantidad AS cantidad,
                detalle.precio AS precio
            FROM
                detalle, producto
            WHERE
                detalle.compra = ".$idCompra."
                AND
                producto.id = detalle.producto
            ORDER BY
                productoNombre";
    }

    public static function selectComunas()
    {
        return "
            SELECT
                *
            FROM
                comuna
            ORDER BY
                nombre";
    }

    public static function insertCalificacion($producto,$calificacion,$cliente)
    {
        return "
            INSERT INTO
                calificacion(producto,valor,cliente)
            VALUES
                ($producto,$calificacion,$cliente)";
    }

    public static function selectComentariosProducto($producto)
    {
        return "
            SELECT
                comentario.*,
                usuario.nombres AS clienteNombre
            FROM
                comentario,
                usuario
            WHERE
                comentario.producto = $producto
                AND
                usuario.id = comentario.cliente";
    }
}
?>