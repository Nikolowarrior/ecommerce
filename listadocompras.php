<?php
try
{
?>
<form method="post" action="<?= HTML::action(Sistema::paginaDetalleCompra) ?>">
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Fecha y Hora</th>
			<th>Cliente</th>
			<th>Productos</th>
			<th>Total</th>
		</tr>
<?php
    foreach (Compra::recuperarTodas() as $compra)
    {
?>
		<tr>
			<td>
				<?= HTML::botonDetalle($compra->id) ?>
			</td>
			<td><?= $compra->fechahora ?></td>
			<td><?= $compra->cliente ?></td>
			<td><?= $compra->cantidadProductos ?></td>
			<td><?= $compra->total ?></td>
        </tr>
<?php
    }
?>
	</table>
</form>
<?php
} catch(Exception $e) {
	Sistema::setError($e->getMessage());
}
?>	