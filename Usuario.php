<?php
include_once("Conexion.php");

class Usuario
{
	private $id;
	private $rut;
	private $password;
	private $tipo;
	private $nombres;
	private $apellido1;
	private $apellido2;
	private $direccion;
	private $email;
	private $comuna;
	private $nombreCompleto;
	private $direccionCompleta;
	private $dv;
	private $rut_dv;
	
	public function __get($propiedad)
	{
		if ($propiedad == "dv")
			return Sistema::DV_RUT($this->rut);
		if ($propiedad == "rut_dv")
			return number_format($this->rut,0,",",".")."-".Sistema::DV_RUT($this->rut);
		return $this->$propiedad;
		number_format($numero, 2, ",", ".");
	}

	private static function cantidad($rut)
	{
		$conexión = new Conexion();
		$datos = $conexión->query(SQL::countUsuario($rut));
		return $datos->fetchColumn();
	}

	private static function existe($rut)
	{
		return self::cantidad($rut) > 0;
	}

	public static function recuperar($rut)
	{
		$conexión= new Conexion();
		$resultado = $conexión->query(SQL::selectusuario($rut));
		return $resultado->fetchObject("Usuario");

	}

	public static function recuperarTodos() {
		$conexion= new Conexion();
		$datos = $conexion->query(SQL::selectUsuarios());
		$usarios = [];
    	while ($usuario = $datos->fetchObject("Usuario"))
		{
        	$usuarios[$usuario->id] = $usuario;
		}
		return $usuarios;
    }

	public static function registrar($usuario)
	{
		try {
			$conexion= new Conexion();
			if (self::recuperar($usuario->rut))
				throw new Exception("Usuario ya está registrado");
			$conexion->query(SQL::insertUsuario($usuario));
		} catch (Exception $e) {
			Sistema::setError($e);
		}
	}
	
	public static function login($rut,$dv,$password)
	{
		if ($rut < 1000000 || $rut > 99999999)
			throw new Exception("RUT incorrecto");
		if (Sistema::DV_RUT($rut) != $dv)
			throw new Exception("DV incorrecto");
		$usuario = self::recuperar($rut);
		if (!$usuario || !password_verify($password, $usuario->password))
			throw new Exception("RUT o password incorrectos");
		return($usuario);
	}
}
?>