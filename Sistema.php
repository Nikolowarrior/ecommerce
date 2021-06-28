<?php
include_once("HTML.php");
include_once("Conexion.php");
include_once("SQL.php");
include_once("Usuario.php");
include_once("Producto.php");
include_once("Carrito.php");
include_once("Compra.php");
include_once("Detalle.php");
include_once("Comuna.php");
include_once("Comentario.php");

class Sistema
{
	const imagenError = "error.jpg";
	const paginaIndex = "index.php";
	const paginaError = "error.php";
	const paginaLogin = "login.php";
	const paginaCompraExitosa = "compraexitosa.php";
	const paginaListadoProductos = "listado.php";
	const paginaAdminCarrito = "admincarrito.php";
	const paginaListadoUsuarios = "listadoUsuarios.php";
	const paginaListadoCompras = "listadocompras.php";
	const paginaDetalleCompra = "detallecompra.php";
	const paginaUsuario = "registrousuario.php";
	const paginaComentarios = "comentarios.php";
	const botonComprar = "comprar";
	const botonEliminar = "eliminar";
	const botonLogin = "login";
	const botonLogout = "logout";
	const botonAgregar = "agregar";
	const botonCarrito = "carrito";
	const botonDetalleCompra = "detalle";
	const botonRegistrarUsuario = "usuario";
	const botonCalificar = "calificar";
	const botonComentar = "comentar";
	const inputRUT = "rut";
	const inputDV = "dv";
	const inputPassword = "password";
	const inputComuna = "comuna";
	const inputCalificacion = "calificacion";
	const idProducto = "idProducto";

	public static function DV_RUT($T)
	{
		// obtenida desde: https://gist.github.com/donpandix/16162fb082f8c7305fe8
		$M=0;$S=1;
		for(;$T;$T=floor($T/10))
			$S=($S+$T%10*(9-$M++%6))%11;
		return $S?$S-1:'k';
	}

	public static function esLogin()
	{
		return isset($_POST[self::botonLogin]);
	}

	public static function esLogout()
	{
		return isset($_POST[self::botonLogout]);
	}

	public static function esAgregarProductoACarrito()
	{
		return isset($_POST[self::botonAgregar]);
	}

	public static function esCarrito()
	{
		return isset($_POST[self::botonCarrito]);
	}

	public static function esEliminar()
	{
		return isset($_POST[self::botonEliminar]);
	}

	public static function esComprar()
	{
		return isset($_POST[self::botonComprar]);
	}

	public static function esRegistrarUsuario()
	{
		return isset($_POST[self::botonRegistrarUsuario]);
	}

	public static function esCalificar()
	{
		return isset($_POST[self::botonCalificar]);
	}

	public static function esComentar()
	{
		return isset($_POST[self::botonComentar]);
	}

	public static function checkOperacion()
	{
		if (self::esLogin())
			self::login();
		else if (self::esLogout())
			self::logout();
		else if (self::esAgregarProductoACarrito())
			self::agregarProductoACarrito();
		else if (self::esCarrito())
			self::setPagina(self::paginaAdminCarrito);
		else if (self::esEliminar())
			self::eliminarProductoDeCarrito();
		else if (self::esComprar())
			Compra::realizar();
		else if (self::esRegistrarUsuario())
			Usuario::registrar((object)$_POST);
		else if (self::esCalificar())
			self::calificarProducto();
		else if (self::esComentar())
			self::comentarProducto();
	}

	private static function login()
	{
		try {
			self::setUsuario(Usuario::login($_POST[self::inputRUT],$_POST[self::inputDV],$_POST[self::inputPassword]));
			Carrito::new();
		} catch (Exception $e) {
			self::setError($e->getMessage());
		}
	}

	private static function logout()
	{
		unset($_SESSION["usuario"]);
	}

	private static function agregarProductoACarrito()
	{
		foreach($_POST["agregar"] as $id => $value) {}
		$cantidad = $_POST["cantidad"][$id];
		Carrito::agregarProducto($id,$cantidad);
	}

	private static function calificarProducto()
	{
		foreach($_POST["calificar"] as $id => $value) {}
		$calificacion = $_POST["calificacion"][$id];
		$cliente = self::getUsuario()->id;
		Producto::calificar($id,$calificacion,$cliente);
	}


	private static function eliminarProductoDeCarrito()
	{
		foreach($_POST["eliminar"] as $id => $value) {}
		$cantidad = $_POST["cantidad"][$id];
		Carrito::eliminarProducto($id,$cantidad);
	}

	public static function hayLogin()
	{
		return isset($_SESSION["usuario"]);
	}

	public static function setUsuario($usuario)
	{
		$_SESSION["usuario"] = serialize($usuario);
	}

	public static function getUsuario()
	{
		return unserialize($_SESSION["usuario"]);
	}

	public static function getNombreUsuario()
	{
		return self::hayLogin() ? self::getUsuario()->nombreCompleto : "";
	}

	public static function esAdmin()
	{
		return self::getUsuario()->tipo == "admin";
	}

	public static function setError($error)
	{
		$_SESSION["error"] = $error instanceof Exception ? $error->getMessage() : $error;
		Sistema::setPagina(Sistema::paginaError);
	}

	public static function getError()
	{
		$error = $_SESSION["error"];
		unset($_SESSION["error"]);
		return $error;
	}

	public static function hayError()
	{
		return isset($_SESSION["error"]);
	}

	public static function setPagina($pagina)
	{
		$_SESSION["pagina"] = $pagina;
	}

    public static function getPagina()
    {
        if (self::hayError())
			$pagina = self::paginaError;
	    else if (!self::hayLogin())
		    $pagina = self::paginaLogin;
		else if (self::hayPagina()) {
			$pagina = isset($_SESSION["pagina"]) ? $_SESSION["pagina"] : $_REQUEST["pagina"];
			unset($_SESSION["pagina"]);
		}
		else
			$pagina = self::paginaListadoProductos;
		return $pagina;;
    }

	public static function hayPagina()
	{
		return isset($_REQUEST["pagina"]) || isset($_SESSION["pagina"]);
	}

	public static function setIdCompra($id)
	{
		$_SESSION["idCompra"] = $id;
	}

	public static function getIdCompra()
	{
		$idCompra = $_SESSION["idCompra"];
		unset($_SESSION["idCompra"]);
		return $idCompra;
	}

	public static function getIdCompraDetalle()
	{
		foreach($_POST[self::botonDetalleCompra] as $id => $value) {}
		return $id;
	}

	public static function comentarProducto()
	{
		foreach($_POST[self::botonComentar] as $id => $value) {}
		$_SESSION[self::idProducto] = $id;
		self::setPagina(self::paginaComentarios);
	}

}
?>