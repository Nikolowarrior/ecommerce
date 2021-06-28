<?php
include_once("Conexion.php");

class Producto
{
	private $id;
	private $nombre;
	private $precio;
	private $stock;
	private $categoria;
	private $categoriaNombre;
	private $cantComentarios;
	private $cantCalificaciones;
	private $sumaCalificaciones;
	private $calificacion;
	
	public function __get($propiedad)
	{
		if ($propiedad == "calificacion") {
			if ($this->cantCalificaciones==0)
				return 0;
			else {
				return round($this->sumaCalificaciones/$this->cantCalificaciones);
			}
		}
		return $this->$propiedad;
	}

	public static function recuperarTodos() {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectProductos());
		$productos = [];
    	while ($producto = $datos->fetchObject("Producto"))
		{
        	$productos[$producto->id] = $producto;
		}
		return $productos;
    }

	public static function recuperar($id) {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectProducto($id));
    	$producto = $datos->fetchObject("Producto");
		return $producto;
    }

	public static function calificar($id,$calificacion,$cliente) {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::insertCalificacion($id,$calificacion,$cliente));
    }


	public static function getStock($id)
	{
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectStockProducto($id));
		return $datos->fetchColumn();
	}

	public function getStockDisponible()
	{
		return(max(0,$this->stock - Carrito::getCantidadProductos($this->id)));
	}

	public function hasStockDisponible()
	{
		return $this->getStockDisponible() > 0;
	}
}
?>