<?php 
namespace controller;

require_once $_SERVER['DOCUMENT_ROOT'] . "/ControleLocacao/dao/conexao.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\model\Usuario.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\dao\UsuarioDao.php";

class UsuarioController {
	
	//private $db;

	public function __construct() {

		//$db = new \conexao\Conexao();

	}

	public function salvar($Login, $Nome, $Email, $Senha, $idGrupoUsuario)
	{
		
		$usuario = new \model\Usuario();
		$usuario->setLogin($Login);
		$usuario->setNome($Nome);
		$usuario->setEmail($Email);
		$usuario->setSenha($Senha);
		$usuario->setIdGrupoUsuario($idGrupoUsuario);

		$usuarioDao = new \dao\UsuarioDao();
		$usuarioDao->salvar($usuario);
		
	}

	public function pegaUsuario($id)
	{
		$usuario = new \dao\UsuarioDao();
		return $usuario->buscarPorCodigo($id);
	}

	/*public function checkIn($login) {
		
		$sql = $this->db->prepare("SELECT * FROM usuario WHERE id = :id");
		$sql->bindValue(":id", $login);
		$sql->execute();

		$array = array();
		if ($sql->rowCount() > 0) {
			$array = $sql->fetch();
		}

		return $array;
	}*/


}

?>