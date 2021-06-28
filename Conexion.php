<?php
class Conexion extends PDO
{
	public function __construct()
	{
		parent::__construct("mysql:host=localhost;dbname=ecommerce","root","");
		$this->exec("SET NAMES UTF8");
	}
}
?>