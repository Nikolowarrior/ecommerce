<?php
try {
	$idCompra = Sistema::getIdCompraDetalle();
?>
	<b>Detalle Compra N° <?= $idCompra ?></b>
	<table border="1">
		<tr>
			<th>Producto</th>
			<th>Cantidad</th>
			<th>Precio</th>
		</tr>
<?php
    foreach (Detalle::recuperarTodo() as $detalle)
    {
?>
		<tr>
			<td><?= $detalle->productoNombre ?></td>
			<td><?= $detalle->cantidad ?></td>
			<td><?= $detalle->precio ?></td>
		</tr>
<?php
	}
?>
	</table>
<?php
} catch(Exception $e) {
	Sistema::setError($e->getMessage());
}
?>	