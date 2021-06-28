<?php
try
{
?>
<form method="post" action="<?= HTML::action(Sistema::paginaAdminCarrito) ?>">
	<table border="1">
		<tr>
			<th>Código</th>
			<th>Nombre</th>
			<th>Precio</th>
			<th>Cantidad</th>
            <th>Operación</th>
		</tr>
<?php
	$total = 0;
	$cantidadProductos = 0;
    foreach (Carrito::get() as $id => $cantidad)
    {
		if ($cantidad <= 0)
			continue;
        $producto = Producto::recuperar($id);
		$cantidadProductos += $cantidad;
		$total += $cantidad * $producto->precio;
?>
		<tr>
			<td><?= $id ?></td>
			<td><?= $producto->nombre ?></td>
			<td><?= $producto->precio ?></td>
			<td><?= HTML::selectProductoCarrito($id,$cantidad) ?></td>
			<td><?= HTML::botonEliminar($id) ?></td>
			</td>
        </tr>
<?php
    }
?>
	</table>
</form>
<form method="post" action="<?= HTML::action() ?>">
	<?= $cantidadProductos ?> producto(s) por un total de $ <?= $total ?>
	<br/><br/>
	<?= HTML::botonComprar() ?>
</form>
<?php
} catch(PDOException $e) {
	Sistema::setError($e->getMessage());
}
?>	