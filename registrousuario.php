<?php
try
{
?>
<form method="post" action="<?= HTML::action(Sistema::paginaListadoUsuarios) ?>">
	<table border="0">
		<tr>
			<td>
				<label for="rut">RUT:</label>
			</td>
			<td>
				<?= HTML::inputRUT() ?>
				<?= HTML::selectTipoUsuario() ?>
			</td>
		</tr>
		<tr>
			<td>
				<label for="password">Password:</label>
			</td>
			<td>
				<?= HTML::inputPassword() ?>
			</td>
		<tr>
			<td>
				<label for="nombres">Nombres:</label>
			</td>
			<td>
				<?= HTML::input("text","nombres","Nombres de pila",35) ?>
			</td>
		</tr>
		<tr>
			<td>
				<label for="apellido1">Apellidos:</label>
			</td>
			<td>
				<?= HTML::input("text","apellido1","Apellido 1") ?>
				<?= HTML::input("text","apellido2","Apellido 2") ?>
			</td>
		</tr>
		<tr>
			<td>
				<label for="direccion">Dirección:</label>
			</td>
			<td>
				<?= HTML::input("text","direccion","Dirección",55) ?>		
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<?= HTML::selectComuna() ?>		
			</td>
		</tr>
		<tr>
			<td>
				<label for="email">email:</label>
			</td>
			<td>
				<?= HTML::input("email","email","correo electrónico",40) ?>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br/>
				<?= HTML::submit("Registrar",Sistema::botonRegistrarUsuario) ?>
			</td>
		</tr>
	</table>
</form>
<?php
} catch(Exception $e) {
	Sistema::setError($e->getMessage());
}
?>	