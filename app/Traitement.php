<?php 
	
	session_start();

	//connexion a la base de donnees 
	 
	include('connexpdo.php');
	$idcom = connexpdo();

	if (isset($_POST['login']) AND isset($_POST['mdp'])) {
		
		$req=$idcom->query("SELECT * FROM utilisateur");

	
		$result= $req->fetchAll(PDO::FETCH_ASSOC);

		for ($i=0; $i < count($result) ; $i++) { 
			if (in_array($_POST['login'], $result[$i]) AND in_array($_POST['mdp'], $result[$i])) {
				echo "ok";
			}
		}
	}
	
	
	/*if (isset($_POST['login']) AND isset($_POST['mdp'])) {

		$req=$idcom->query("SELECT * FROM utilisateur");

		$result= $req->fetchAll();
		var_dump($result); exit();

		in_array($_POST['login'], result);

		if ( $_POST['login']==$login AND $_POST['mdp']==$mdp ) {
			echo "ok";
		}else {
			echo "no";
		}
	}*/

		$erreur=$idcom->errorinfo();
		echo "erreur".$idcom->errorCode().$erreur[2];
		var_dump($_POST);
	}*/
		
		


 ?>