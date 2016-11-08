<?php  
//parametres de connexion

$host="localhost";
$base="projetbdd";
$user="root";
$pass="";

// variable de connexion 

$idcom= new PDO("mysql:host=$host;dbname=$base",$user,$pass);

//initialisation des variables

$req="SELECT * FROM compte,user WHERE compte.user=user.id_user";
$result= $idcom->query($req);
$retour=$result->fetchAll(PDO::FETCH_ASSOC);

//bloc de gestion de la creation des comptes d'utilisateur

if (isset($_POST['nom']) AND isset($_POST['prenom']) AND isset($_POST['dateNais'])AND isset($_POST['num_phone'])AND isset($_POST['email'])AND isset($_POST['lib_cpt']) AND isset($_POST['pseudo'])AND isset($_POST['mdp'])) {


	$nom=$idcom->quote($_POST['nom']);
	$prenom=$idcom->quote($_POST['prenom']);
	$dateNais=$idcom->quote($_POST['dateNais']);
	$num_phone=$idcom->quote($_POST['num_phone']);
	$email=$idcom->quote($_POST['email']);
	$pseudo=$idcom->quote($_POST['pseudo']);
	$mdp=$idcom->quote($_POST['mdp']);
	$lib_cpt=$idcom->quote($_POST['lib_cpt']);

	$reqUS="INSERT INTO user(nom,prenom,dateNais,num_phone,email) VALUES($nom,$prenom,$dateNais,$num_phone,$email)";	

	$reqL="SELECT id_user from user ORDER BY id_user LIMIT 1";


	$nblignes= $idcom->exec($reqUS);
	

	$res = $idcom->query($reqL);
	$id= $res->fetchAll(PDO::FETCH_NUM);
	$lastID= intval($id[0][0]);


	$reqCpt="INSERT INTO compte(pseudo,mdp,lib_cpt,etat_cpt,user) VALUES ($pseudo,$mdp,$lib_cpt,1,$lastID)";
	$compte= $idcom->query($reqCpt);
	
	
	// bloc de notification de l'etat de la creation de l'utilisateur


	if ($nblignes!=1 || $compte==null) {

		$msg_err=$idcom->errorInfo();

		echo "Insertion impossible, code".$idcom->errorCode()."". $msg_err[2];
	}else {
		echo "Creation de l'utilisateur effectuee avec succes <br/>";	
		echo "Creation du compte de l'utilisateur effectuee avec succes";
	}

}



// bloc de gestion des comptes des utilisateurs 
if (isset($_POST['instruction']) AND isset($_POST['id'])) {

	$indice=$_POST['id'];

	$instruction=$_POST['instruction'] ;


	//initialisation des requetes

	$id_user= $retour[$indice]['id_user'];

	
	$bloc   ="UPDATE compte set etat_cpt=0 Where user=$id_user";
	$debloc ="UPDATE Compte set etat_cpt=1 Where user=$id_user";
	$sup    ="DELETE Compte WHERE user=$id_user";

	//requete a executer en fonction de l'instruction

	if ($instruction=="Bloquer") {

		$res= $idcom->exec($bloc);
		echo "bloquer avec succes";
		
	} elseif ($instruction=="Debloquer") {

		$res= $idcom->exec($debloc);
		echo "bloquer avec succes";

	}elseif ($instruction=="Suprimer") {
		
		$res= $idcom->exec($sup);
		echo "bloquer avec succes";

	}else {
		echo "element c pas bon ";
	}

	
		
}
	
?>

