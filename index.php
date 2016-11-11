
<?php 


if (isset($_GET['p'])) {
		$page = $_GET['p'];
	}else{
		$page = 'accueil';
	}

ob_start();
if ($page === 'accueil') {
	require 'page/accueil.php';
} elseif ($page === 'incident') {
	require 'page/incident.php';
} elseif ($page === 'geolocalisation') {
	require 'page/Carte.php';
}


$content = ob_get_clean();

require 'page/template/template.php';


