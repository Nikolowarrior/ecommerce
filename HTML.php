<?php
class HTML
{
    const homeIcon = "&#127968";

    public static function linkHome()
    {
        return "
            <a href=\"index.php\">".self::homeIcon."</a>";
    }

    public static function name($nombre,$id=null)
    {
        $name = "name=\"".$nombre;
        if (!is_null($id))
            $name .= "[".$id."]";
        $name .= "\"";
        return $name;
    }

    public static function selectProducto($producto)
    {
        $select = "<select ".self::name("cantidad",$producto->id).">";
        for ($i = 1; $i<=$producto->getStockDisponible(); ++$i)
        {
		    $select .= "<option>". $i."</option>\n";
		}
        $select .= "</select>\n";
        return $select;
    }

    public static function selectProductoCarrito($id,$cantidad)
    {
        $select = "<select name=\"cantidad[".$id."]\">\n";
        for ($i = $cantidad; $i>=1; --$i)
        {
		    $select .= "<option>". $i."</option>\n";
		}
        $select .= "</select>\n";
        return $select;
    }

    public static function action($pagina=null)
    {
        return "
            index.php".(is_null($pagina) ? "" : "?pagina=".$pagina);
    }

    public static function botonLogout()
    {
        return "
            <form method=\"post\" action=\"index.php\">
                <input type=\"submit\" name=\"logout\" value=\"Logout\" />
            </form>";
    }

    public static function botonCarrito()
    {
        $html = "
            <input type=\"submit\" name=\"carrito\" value=\"Carrito (".Carrito::getCantidadProductos().")\" />";
        if (Carrito::getCantidadProductos()>0)
            $html = "
                <form method=\"post\" action=\"index.php?pagina=admincarrito.php\">"
                    .$html.
                "</form>";
        return $html;
    }

    public static function botonEliminar($id)
    {
        return "
            <input type=\"submit\" name=\"".Sistema::botonEliminar."[".$id."]\" value=\"eliminar\" />";
    }

    public static function botonComprar()
    {
        return "
            <input type=\"submit\" name=\"".Sistema::botonComprar."\" value=\"comprar\" />";
    }

    public static function botonAgregar($id)
    {
        return "
            <input type=\"submit\" name=\""
            .Sistema::botonAgregar.
            "[".$id."]\" value=\"agregar\" />";
    }

    public static function botonCalificar($id)
    {
        return "
            <input type=\"submit\" name=\""
            .Sistema::botonCalificar.
            "[".$id."]\" value=\"calificar\" />";
    }

    public static function botonComentar($id,$cantidad)
    {
        return "
            <input type=\"submit\" name=\""
            .Sistema::botonComentar.
            "[".$id."]\" value=\"comentar (".$cantidad.")\" />";
    }

    public static function botonDetalle($id)
    {
        return "
            <input type=\"submit\" name=\""
            .Sistema::botonDetalleCompra.
            "[".$id."]\" value=\"".$id."\" />";
    }

    public static function cabecera()
    {
        return "
            <table width=\"100%\">
	            <tr>
		            <td colspan=\"2\" align=\"center\" valign=\"middle\" bgcolor=\"ForestGreen\">
			            <h1>eCommerce Nicolás Toloza el Zar ".self::linkHome()."</h1>
			            <h2>".Sistema::getNombreUsuario()."</h2>
		        </td>
	            </tr>
            </table>";

    }

    public static function pie()
    {
        return "
            <table width=\"100%\">
                <tr>
		            <td align=\"center\" valign=\"middle\" bgcolor=\"ForestGreen\" style=\"padding:20px;\">
			            <b>&copy; <i>Nicolás Poblete</i></b>&nbsp;&nbsp;&nbsp;&nbsp;
			            <b>&copy; <i>José Toloza</i></b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src=\"ico_face.png\" />&nbsp;
                        <img src=\"ico_twitter.png\" />
		            </td>
	            </tr>
            </table>";
    }

    public static function menu()
    {
        if (!Sistema::hayLogin())
            return "";
        $menu = "
            <table width=\"100%\" border=\"0\">
                <tr valign=\"top\">
                    <td align=\"center\">"
                        .HTML::botonLogout()."
                    </td>";
        if (Sistema::esAdmin())
            $menu .= "
                    <td align=\"center\">
                        <a href=\"index.php?pagina=".Sistema::paginaListadoUsuarios."\">Usuarios</a>
                    </td>
                    <td align=\"center\">
                        <a href=\"index.php?pagina=".Sistema::paginaListadoCompras."\">Compras</a>
                    </td>"
                    ;
        $menu .= "
                    <td align=\"center\">"
                        .HTML::botonCarrito()."
                    </td>
            </table>";
        return $menu;
    }

    public static function pagina()
    {
        try {
            include_once(Sistema::getPagina());
        } catch (Exception $e) {
            Sistema::setError($e);
        }
    }

    public static function botonOk($pagina=null)
    {
        return "
            <form method=\"post\" action=\"index.php"
            .(is_null($pagina) ? "" : "?pagina=".$pagina)."\">
                <input type=\"submit\" name=\"ok\" value=\"ok\" />
            </form>";
    }

    public static function inputDV()
    {
        return "
            <select ".self::name(Sistema::inputDV).">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>K</option>
            </select>";
    }

    public static function inputRUT()
    {
        return "
            <input type=\"number\" name=\"".Sistema::inputRUT."\" placeholder=\"número sin puntos\" required/>";
    }

    public static function inputRUTyDV()
    {
        return
            self::inputRUT()."<b>-</b>".self::inputDV();
    }

    public static function inputPassword()
    {
        return "
            <input type=\"password\" name=\"".Sistema::inputPassword."\" placeholder=\"password\" required/>";
    }

    public static function botonLogin()
    {
        return "
            <input type=\"submit\" name=\"".Sistema::botonLogin."\" value=\"Login\"/>";
    }

    public static function input($tipo,$nombre,$texto,$tamano=null)
    {
        return "
            <input type=\"".$tipo."\" name=\"".$nombre."\" placeholder=\"".$texto."\" required"
            .(is_null($tamano) ? "" : " size=\"".$tamano."\"")."/>";

    }

    public static function submit($texto,$nombre=null)
    {
        return "
            <input type=\"submit\"".(is_null($nombre) ? "" : " name=\"".$nombre."\"")." value=\"".$texto."\" />";
    }

    public static function selectComuna()
    {
        try {
            $select = "<select name=\"".Sistema::inputComuna."\">";
            foreach (Comuna::recuperarTodas() as $comuna)
                $select .= "<option value=\"".$comuna->id."\">".$comuna->nombre."</option>";
            $select .= "</select>";
            return $select;
        } catch (Exceptio $e) {
            Sistema::setError($e);
        }
    }

    public static function selectTipoUsuario()
    {
        return "
            <select name=\"tipo\">
                <option>cliente</option>
                <option>admin</option>
            </select>";
    }

    public static function estrellas($cantidad)
    {
        $estrellas = "";
        for ($i=1; $i<=$cantidad; ++$i)
            $estrellas .= "&#9733;";
        return $estrellas;
    }

    public static function inputCalificacion($id)
    {
        return "
            <select name=\"".Sistema::inputCalificacion."[".$id."]\">
                <option>5</option>
                <option>4</option>
                <option>3</option>
                <option>2</option>
                <option>1</option>
            </select>";
    }
}
?>