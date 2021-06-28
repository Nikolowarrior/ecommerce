<form method="post" action="index.php">
    <table>
        <tr>
            <td align="center">
                <img src="<?= Sistema::imagenError ?>" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <h3><?= Sistema::getError() ?></h3>
            </td>
        </tr>
        <tr>
            <td align="center">
                <?= HTML::botonOk() ?>
            </td>
        </tr>
    </table>
</form>