<?php
class Detalle
{
	private $id;
	private $productoNombre;
	private $cantidad;
	private $precio;

	public function __get($propiedad)
	{
		return $this->$propiedad;
	}

	public static function recuperarTodo() {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectDetalle(Sistema::getIdCompraDetalle()));
		$detalleCompra = [];
    	while ($detalle = $datos->fetchObject("Detalle"))
		{
        	$detalleCompra[$detalle->id] = $detalle;
		}
		return $detalleCompra;
    }
}
?>