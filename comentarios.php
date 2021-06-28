<?php
try {
	$producto = $_SESSION[Sistema::idProducto]
?>
<h2>Comentarios para <?= Producto::recuperar($producto)->nombre ?></h2>
<form method="post" action="<?= HTML::action() ?>">
	<table border="1">
		<tr>
			<th>Cliente</th>
			<th>Comentario</th>
		</tr>
<?php
    foreach (Comentario::recuperarDeProducto($producto) as $comentario)
    {
?>
		<tr>
			<td><?= $comentario->clienteNombre ?></td>
			<td><?= $comentario->descripcion ?></td>
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