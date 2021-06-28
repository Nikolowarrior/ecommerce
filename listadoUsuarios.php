<?php
try
{
?>
	<table border="1">
		<tr>
			<th>RUT</th>
			<th>Nombre</th>
			<th>Dirección</th>
			<th>eMail</th>
			<th>Tipo</th>
		</tr>
<?php
    foreach (Usuario::recuperarTodos() as $usuario)
    {
?>
		<tr>
			<td><?= $usuario->rut_dv ?></td>
			<td><?= $usuario->nombreCompleto ?></td>
			<td><?= $usuario->direccionCompleta ?></td>
			<td><?= $usuario->email ?></td>
			<td><?= $usuario->tipo ?></td>
        </tr>
<?php
    }
?>
	</table>
	<br />
	<form method="post" action="<?= HTML::action(Sistema::paginaUsuario) ?>">
		<?= HTML::submit("Nuevo Usuario") ?>
	</form>
<?php
} catch(Exception $e) {
	Sistema::setError($e);
}
?>	