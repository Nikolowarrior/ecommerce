<?php
class Comuna
{
	private $id;
	private $nombre;

	public function __get($propiedad)
	{
		return $this->$propiedad;
	}

	public static function recuperarTodas()
	{
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectComunas());
		$comunas = [];
    	while ($comuna = $datos->fetchObject("Comuna"))
		{
        	$comunas[$comuna->id] = $comuna;
		}
		return $comunas;
    }
}
?>