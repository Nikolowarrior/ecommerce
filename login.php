<form method="post" action="index.php">
    <table>
        <tr>
            <td>
                <label for="rut">RUT:</label>
            </td>
            <td>
                <?= HTML::inputRUTyDV() ?>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">Password:</label>
            </td>
            <td>
                <?= HTML::inputPassword() ?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <?= HTML::botonLogin() ?>
            </td>
        </tr>
    </table>
    <html>
<head>
