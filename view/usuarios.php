<?php 
require $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\model\Usuario.php";

$u = new Usuario();
$u->setLogin("Teste333");
$u->setNome("Teste333");
$u->setEmail("Teste333@teste.com");
$u->setSenha("1233");
$u->setIdGrupoUsuario("123");
$u->salvar();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Usuários</title>
</head>
<body>
<?php 
	//print_r($res);
echo "usuario cadastrado com sucesso";
 ?>
</body>
</html>