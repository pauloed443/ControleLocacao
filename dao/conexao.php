<?php 
namespace conexao;

class Conexao {
	
	private static $db;
	private $dbname = 'leidebrink';
	private $host = 'localhost';
	private $user = 'root';
	private $pass = '';

	public function __construct() {

	}

	public static function getInstance() {

		if (!isset(self::$db)) {
			self::$db = new PDO("mysql:dbname=".$dbname.";host=".$host."", '$user', '$pass', array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
			self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
		}

		return self::$db;

	}
}
?>