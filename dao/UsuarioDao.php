<?php 
namespace dao;

require_once "conexao.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "\ControleLocacao\model\Usuario.php";

Class UsuarioDao {

	private $pdo;

	public function __construct() {
		$this->getInstance();
	}

	public function getInstance() {
		try {
			$this->pdo = new PDO("mysql:dbname=leidebrink;host=localhost:8080", "root", "");
		} catch(PDOException $e) {
			echo "Falha ao executar a sentença 001" . $e->getMessage();
		}
	}

	public function salvar(Usuario $usuario) {
		if (!empty($usuario->getId())) {
			$sql = "UPDATE usuario SET
								Login = ?,
								Nome = ?,
								Email = ?,
								Senha = ?,
								idGrupoUsuario = ?
					WHERE Id = ?";
			$sql = $this->pdo->prepare($sql);
			$sql->execute(array(
							$usuario->getLogin(),
							$usuario->getNome(),
							$usuario->getEmail(),
							$usuario->getSenha(),
							$usuario->getidGrupoUsuario(),
							$usuario->getId(),
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
							$usuario->getLogin(),
							$usuario->getNome(),
							$usuario->getEmail(),
							$usuario->getSenha(),
							$usuario->getidGrupoUsuario()
							));
			header("cadastrado!");
		}
	}

    public function inserir(Usuario $usuario) {

        try {
            $sql = "INSERT INTO usuario (
					            	Login,
					                Nome,
					                Email,
					                Senha )
                	VALUES (
					            	:login
					            	:nome,
					            	:email,
					            	:senha )";

			$p_sql = $this->pdo->prepare($sql);

			$p_sql->bindValue(":login", $usuario->getLogin());
			$p_sql->bindValue(":nome", $usuario->getLogin());
			$p_sql->bindValue(":email", $usuario->getLogin());
			$p_sql->bindValue(":senha", $usuario->getLogin());

			return $p_sql->execute();
		} catch(Exception $e) {
			print "Ocorreu um erro ao tentar executar esta inserção, tente novamente mais tarde.";
		}

    }

    public function buscarPorCodigo($id) {
    	
    	try {
            $sql = "SELECT * FROM usuario WHERE Id = :id";
            $p_sql = $this->pdo->prepare($sql);
            $p_sql->bindValue(":id", $id);
            $p_sql->execute();

            return $p_sql->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            print "Ocorreu um erro ao tentar executar esta consulta, tente novamente mais tarde.";

    	}

    }

    private function populaUsuario($row) {
        $u = new Usuario();
        $u->setId($row['Id']);
        $u->setLogin($row['Login']);
        $u->setNome($row['Nome']);
        $u->setEmail($row['Email']);
        $u->setSenha($row['Senha']);
        $u->setIdGrupoUsuario($row['idGrupoUsuario']);

        return $u;
    }
}

?>