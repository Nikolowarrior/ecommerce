<?php
session_start();
include_once("Sistema.php");
Sistema::checkOperacion();
?>
<head>
	<title>Mi eCommerce</title>
	<link rel="shortcut icon" href="logo.ico" />
</head>
<body>
	<div align="center">
		<?= HTML::cabecera() ?>
		<?= HTML::menu() ?>
		<?= HTML::pagina() ?>
		<?= HTML::pie() ?>
	</div>
</body>