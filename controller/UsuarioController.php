<?php 
namespace controller;

require_once $_SERVER['DOCUMENT_ROOT'] . "/ControleLocacao/dao/conexao.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/ControleLocacao/dao/UsuarioDao.php";

class UsuarioController {
	
	//private $db;

	public function __construct() {

		//$db = new \conexao\Conexao();

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