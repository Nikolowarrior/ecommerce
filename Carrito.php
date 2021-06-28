<?php
include_once("Conexion.php");

class Carrito
{
	public static function get()
	{
		return unserialize($_SESSION["carrito"]);
	}

	private static function set($carrito)
	{
		$_SESSION["carrito"] = serialize($carrito);
	}

	public static function new()
	{
		$_SESSION["carrito"] = serialize(array());
	}

	public static function getCantidadProductos($id=null)
	{
		$carrito = self::get();
		if (!is_null($id))
			return array_key_exists($id,$carrito) ? $carrito[$id] : 0;
		$cantidadProductos = 0;
		foreach($carrito as $cantidadProducto) {
			if ($cantidadProducto<=0)
				continue;
			$cantidadProductos += $cantidadProducto;
		}
		return $cantidadProductos;
	}

	public function estaVacio()
	{
		return $this->getCantidadProductosDistintos() == 0;
	}

	public static function agregarProducto($id,$cantidad)
	{
		$carrito = self::get();
		if (array_key_exists($id,$carrito))
			$carrito[$id] += $cantidad;
		else 
			$carrito[$id] = $cantidad;
		self::set($carrito);
	}

	public static function eliminarProducto($id,$cantidad)
	{
		$carrito = self::get();
		$carrito[$id] -= $cantidad;
		if ($carrito[$id]<=0)
			unset($carrito[$id]);
		self::set($carrito);
	}
}
?>