<?php
class Compra
{
	private $id;
	private $fechahora;
	private $cliente;
	private $cantidadProductos;
	private $total;

	public function __get($propiedad)
	{
		return $this->$propiedad;
	}

	public static function recuperarTodas() {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectCompras());
		$compras = [];
    	while ($compra = $datos->fetchObject("Compra"))
		{
        	$compras[$compra->id] = $compra;
		}
		return $compras;
    }

	public static function realizar()
	{
		try {
			$conexion = new Conexion();
			$conexion->beginTransaction();
			$idCliente = Sistema::getUsuario()->id;
			$conexion->query(SQL::insertCompra($idCliente));
			$datos = $conexion->query(SQL::selectIdNuevaCompra());
			$idCompra = $datos->fetchColumn();
			foreach (Carrito::get() as $idProducto => $cantidad) {
				if ($cantidad<=0)
					continue;
				$producto = Producto::recuperar($idProducto);
				if ($producto->stock<$cantidad)
				{
					$conexion->rollBack();
					Sistema::setError("Stock insuficiente de ".$producto->nombre);
					return;
				}
				$conexion->query(SQL::reducirStockProducto($idProducto,$cantidad));
				$conexion->query(SQL::insertDetalleCompra($idCompra,$idProducto,$cantidad,$producto->precio));
			}
			$conexion->commit();
			Carrito::new();
			Sistema::setIdCompra($idCompra);
			Sistema::setPagina(Sistema::paginaCompraExitosa);
		} catch (Excepcion $e) {
			Sistema::setError($e->getMessage());
		}
	}
}
?>