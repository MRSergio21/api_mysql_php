<?php
include_once 'DB.php';
class Json extends DB{
  public function getJsons(){
    	$query = $this->connect()->query('SELECT * FROM client');
    	return $query;
	}
}
?>