<?php
try
{
?>
<form method="post" action="<?= HTML::action() ?>">
	<table border="1">
		<tr>
			<th>Calif.</th>
			<th>Código</th>
			<th>Nombre</th>
			<th>Precio</th>
			<th>Stock</th>
			<th>Categoría</th>
			<th>Calificar</th>
			<th>Comentar</th>
		</tr>
<?php
    foreach (Producto::recuperarTodos() as $producto)
    {
?>
		<tr>
			<td><?= HTML::estrellas($producto->calificacion) ?></td>
			<td><?= $producto->id ?></td>
			<td><?= $producto->nombre ?></td>
			<td><?= $producto->precio ?></td>
			<td>
			<?php
			if ($producto->hasStockDisponible())
			{
			?>
				<?= HTML::selectProducto($producto) ?>
				<?= HTML::botonAgregar($producto->id) ?>
			<?php
			}
			else {
			?>
				Sin stock
			<?php	
			}
			?>
			</td>
			<td><?= $producto->categoriaNombre ?></td>
			<td>
				<?= HTML::inputCalificacion($producto->id) ?>
				<?= HTML::botonCalificar($producto->id) ?>
			</td>
			<td>
				<?= HTML::botonComentar($producto->id,$producto->cantComentarios) ?>
			</td>
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