<?php
class Comentario
{
	private $id;
	private $producto;
	private $cliente;
	private $descripcion;

	public function __get($propiedad)
	{
		return $this->$propiedad;
	}

	public static function recuperarDeProducto($producto) {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectComentariosProducto($producto));
		$comentarios = [];
    	while ($comentario = $datos->fetchObject("Comentario"))
		{
        	$comentarios[$comentario->id] = $comentario;
		}
		return $comentarios;
    }
}
?>