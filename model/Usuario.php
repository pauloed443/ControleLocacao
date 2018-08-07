<?php 
namespace model;

class Usuario {

	private $Id;
	private $Login;
	private $Nome;
	private $Email;
	private $Senha;
	private $idGrupoUsuario;

	/*private $pdo;

	public function __construct($i="") {
		$this->getInstance();
		if (!empty($i)) {
			$sql = "SELECT * FROM usuario WHERE Id = ?";
			$sql = $this->pdo->prepare($sql);
			$sql->execute(array($i));

			if ($sql->rowCount() > 0) {
				$usuario = $sql->fetch();
				$this->Id = $usuario['Id'];
				$this->Login = $usuario['Login'];
				$this->Nome = $usuario['Nome'];
				$this->Email = $usuario['Email'];
				$this->Senha = $usuario['Senha'];
				$this->idGrupoUsuario = $usuario['idGrupoUsuario'];
			}
		}
	}

	public function getInstance() {
		try {
			$this->pdo = new PDO("mysql:dbname=leidebrink;host=localhost", 'root', '');
		} catch(PDOException $e) {
			echo "Falha ao executar a sentença 001" . $e->getMessage();
		}
	}*/

	public function getId() {
		return $this->Id;
	}

	public function getLogin() {
		return $this->Login;
	}

	public function setLogin($Login) {
		$this->Login = $Login;
	}

	public function getNome() {
		return $this->Nome;
	}

	public function setNome($Nome) {
		$this->Nome = $Nome;
	}

	public function getEmail() {
		return $this->Email;
	}

	public function setEmail($Email) {
		$this->Email = $Email;
	}

	public function getSenha() {
		return $this->Senha;
	}

	public function setSenha($Senha) {
		$this->Senha = md5($Senha);
	}

	public function getIdGrupoUsuario() {
		return $this->idGrupoUsuario;
	}

	public function setIdGrupoUsuario($idGrupoUsuario) {
		$this->idGrupoUsuario = $idGrupoUsuario;
	}

	public function salvar() {
		if (!empty($this->Id)) {
			$sql = "UPDATE usuario SET
								Login = ?,
								Nome = ?,
								Email = ?,
								Senha = ?,
								idGrupoUsuario = ?
					WHERE Id = ?";
			$sql = $this->pdo->prepare($sql);
			$sql->execute(array(
							$this->Login,
							$this->Nome,
							$this->Email,
							$this->Senha,
							$this->idGrupoUsuario,
							$this->Id,
							));
		} else {
			$sql = "INSERT INTO usuario(
									Login,
									Nome,
									Email,
									Senha,
									idGrupoUsuario)
					VALUES (?,?,?,?,?)";
			$sql = $this->pdo->prepare($sql);
			$sql->execute(array(
							$this->Login,
							$this->Nome,
							$this->Email,
							$this->Senha,
							$this->idGrupoUsuario
							));
		}
	}

}

?>