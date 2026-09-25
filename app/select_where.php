<?php
session_start();
require_once __DIR__ . '/../includes/functions.php';
require_once __DIR__ . '/../login/verifica_user.php'; 
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestão de Alunos</title>
</head>

<body>
    <?php include __DIR__ . '/../includes/header.php'; ?>
    <main>
        <h1>Consulte um aluno</h1>
        <form action="" method="POST">
            <label for="id">ID: </label>
            <input type="number" name="id" id="id" placeholder="Insira o ID para consultar" required>
            <input type="submit" value="Consultar">
        </form>
        <?php
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            consultar($conexao, $_POST['id']);
        }
        ?>
    </main>
    <?php include __DIR__ . '/../includes/footer.php'; ?>
</body>

</html>