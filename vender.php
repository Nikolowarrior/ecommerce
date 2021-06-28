<?php
if (isset($_SESSION["carrito"])) {
?>
<table border="1" align="center">
	<tr>
		<th>Código</th>
		<th>Descripción</th>
		<th>Precio</th>
		<th>Cantidad</th>
		<th>SubTotal</th>
	</tr>
<?php
	foreach ($_SESSION["carrito"] as $codigo => $cantidad) {
		$herramienta = Herramienta::recuperar($codigo);
?>
	<tr>
		<td>
			<?= $codigo ?>
		</td>
		<td><?= $herramienta->getDescripcion() ?></td>
		<td><?= $herramienta->getPrecio() ?></td>
		<td>
			<?= $cantidad ?>
		</td>
		<td><?= $herramienta->getPrecio() * $cantidad ?></td>
	</tr>
<?php	
	}
?>
</table>
<?php
}
?>