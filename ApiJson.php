<?php
include_once 'Json.php';
class ApiJsons{
	public function getAll(){
    	$json = new Json();//tiene la conección a la bd
    	$queries_res = $json->getJsons();//trae la query a la BD
		$keys=array_keys($queries_res);
		foreach($queries_res as $key => $res){
			$data[$key]=[];
    	while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
			$data[$key][]= $row;
		}
	}
		return $data;
	}
	}
	/*echo "<pre>";
	print_r($keys);
	echo "</pre>";*/
?>