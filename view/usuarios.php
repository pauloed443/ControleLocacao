<?php 
require $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\model\Usuario.php";
require $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\controller\UsuarioController.php";

/*$u = new Usuario();
$u->setLogin("Teste333");
$u->setNome("Teste333");
$u->setEmail("Teste333@teste.com");
$u->setSenha("1233");
$u->setIdGrupoUsuario("123");
$u->salvar();
*/
$uc = new \controller\UsuarioController();
$uc->salvar("Teste3333", "Teste3333", "Teste3333@333.com", "Teste3333", "3333");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Usuários</title>
</head>
<body>
<?php 
	//print_r($res);
echo "usuario sendo cadastrado!";
 ?>
</body>
</html>