<?php
include_once 'Json.php';
class ApiJsons{
	public function getAll(){
    	$json = new Json();//tiene la conección a la bd
    	$res = $json->getJsons();//trae la query a la BD
    	$users = [];
    	while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
			$users[] = $row;
		}
		return $users;
	}
}
?>