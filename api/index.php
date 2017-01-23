<?php

function getCurrentUri()
{
	$basepath = implode('/', array_slice(explode('/', $_SERVER['SCRIPT_NAME']), 0, -1)) . '/';
	$uri = substr($_SERVER['REQUEST_URI'], strlen($basepath));
	if (strstr($uri, '?')) $uri = substr($uri, 0, strpos($uri, '?'));
	$uri = '/' . trim($uri, '/');
	return $uri;
}

$base_url = getCurrentUri();
$routes = array();
$routes = explode('/', $base_url);
foreach($routes as $route)
{
	if(trim($route) != '')
	array_push($routes, $route);
}

/*
 Now, $routes will contain all the routes. $routes[0] will correspond to first route. For e.g. in above example $routes[0] is search, $routes[1] is book and $routes[2] is fitzgerald
 */
//var_dump($base_url,TRUE);
//var_dump($routes,TRUE);

if($routes[1] == 'profile'){
	
	if(isset($routes[2])){
		$profile = getProfile($routes[2]);
		//header('Content-Type: application/json');
		//print_r($profile);
		//echo $profile['CONTACT_NM'];
		
		header('Content-Type: application/json');
		$data = json_encode(getProfile($routes[2]), JSON_PRETTY_PRINT );
		echo $data;
	}
	else{
		http_response_code(500);
		header('Content-Type: application/json');
		$error = json_encode(array('error'=>'Username & Password Required.'), JSON_PRETTY_PRINT );
		echo $error;
	}
			
}else if($routes[1] == 'prospects'){
	$prospects = getProsoects();
	header('Content-Type: application/json');
	$data = json_encode($prospects, JSON_PRETTY_PRINT );
	echo $data;
	
}else if($routes[1] == 'traits'){
	$prospects = getTraits($routes[2]);
	header('Content-Type: application/json');
	$data = json_encode($prospects, JSON_PRETTY_PRINT );
	echo $data;
	
}else if($routes[1] == 'login'){
	
	if(isset($_POST['username'], $_POST['password'])){
		$count = API::login($_POST['username'], $_POST['password']);
		$data = json_encode($count, JSON_PRETTY_PRINT );
		echo $data;
	}
	else{
		http_response_code(500);
		header('Content-Type: application/json');
		$error = json_encode(array('error'=>'Username & Password Required.'), JSON_PRETTY_PRINT );
		echo $error;
	}
			
}

function getProfile($id){
	$db = mysqli_connect("localhost", "root", "", "prospect");
	
	if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
    }
	
	//$result = $db->query("SELECT * FROM CONTACT WHERE CONTACT_ID='".$id."'");
	$result = $db->query("SELECT CONTACT.*,CONTACT_TO_CONTACT_RLNTP.OFFICER_CONTACT_ID,(SELECT CONTACT_NM FROM contact WHERE CONTACT_ID=contact_to_contact_rlntp.OFFICER_CONTACT_ID) AS OFFICER_CONTACT_NM, (SELECT CONTACT_PIC_URL FROM contact WHERE CONTACT_ID=contact_to_contact_rlntp.OFFICER_CONTACT_ID) AS OFFICER_CONTACT_PIC_URL,CONTACT_TO_CONTACT_RLNTP.MATCH_SCORE FROM CONTACT JOIN CONTACT_TO_CONTACT_RLNTP ON CONTACT.CONTACT_ID = CONTACT_TO_CONTACT_RLNTP.PROS_CONTACT_ID WHERE CONTACT_ID=".$id." ORDER BY MATCH_SCORE DESC");
    
	mysqli_close($db);
	
	return $result->fetch_object();
	
}


function getProsoects(){
	$db = mysqli_connect("localhost", "root", "", "prospect");
	
	if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
    }
	
	$myArray = array();
	if ($result = $db->query("SELECT * FROM CONTACT WHERE CONTACT_TYPE_FLG='P'")) {

        while($row = $result->fetch_array(MYSQL_ASSOC)) {
            $myArray[] = $row;
			

        }
       
	   //echo json_encode($myArray);
   }
	
	//$result = $db->query("SELECT * FROM CONTACT");
    
	mysqli_close($db);
	
	//return $result->fetch_array();
	return $myArray;
}

function getTraits($id){
	$db = mysqli_connect("localhost", "root", "", "prospect");
	
	if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
    }
	$final = array('id'=>1,'Personality'=>array('Agreeableness'=>array(),'Conscientiousness'=>array(),'Openness'=>array(),'Introversion/Extraversion'=>array(),'Emotional range'=>array()),'Consumer Needs'=>array(),'Values'=>array());
	$myArray = array();
	if ($result = $db->query("SELECT * FROM contact_trait_typ2 WHERE CONTACT_ID=1 AND CONTACT_TRAIT_TYP_SUBGRP='Agreeableness'")) {

        while($row = $result->fetch_array(MYSQL_ASSOC)) {
            //$myArray[] = $row;
            $Agreeableness[$row['CONTACT_TRAIT_TYP_DESC']] = $row['CONTACT_TRAIT_TYP_WEIGHT'];
            //$myArray[''] = $row;
			
			

        }
       
	   //echo json_encode($myArray);
   }
	$final['Personality']['Agreeableness'] = $Agreeableness;
	if ($result = $db->query("SELECT * FROM contact_trait_typ2 WHERE CONTACT_ID=1 AND CONTACT_TRAIT_TYP_GRP='Consumer Needs'")) {

        while($row = $result->fetch_array(MYSQL_ASSOC)) {
            //$myArray[] = $row;
            $needs[$row['CONTACT_TRAIT_TYP_DESC']] = $row['CONTACT_TRAIT_TYP_WEIGHT'];
            //$myArray[''] = $row;
			
			

        }
       
	   //echo json_encode($myArray);
   }
	$final['Consumer Needs'] = $needs;
	if ($result = $db->query("SELECT * FROM contact_trait_typ2 WHERE CONTACT_ID=1 AND CONTACT_TRAIT_TYP_GRP='Values'")) {

        while($row = $result->fetch_array(MYSQL_ASSOC)) {
            //$myArray[] = $row;
            $values[$row['CONTACT_TRAIT_TYP_DESC']] = $row['CONTACT_TRAIT_TYP_WEIGHT'];
            //$myArray[''] = $row;
			
			

        }
       
	   //echo json_encode($myArray);
   }
	$final['Values'] = $values;
	//$result = $db->query("SELECT * FROM CONTACT");
    
	mysqli_close($db);
	
	//return $result->fetch_array();
	return $final;
	//return $myArray;
	
	
}



?>