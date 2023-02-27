<?php
	include_once 'ApiJson.php';
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Allow: GET, POST, OPTIONS, PUT, DELETE");
	$method = $_SERVER['REQUEST_METHOD'];
	//print_r('method'.$method);
	if($method == "OPTIONS") {
    	die();
	}
	$api = new ApiJsons();
	$data=$api->getAll();
	echo json_encode($data);
?>
 