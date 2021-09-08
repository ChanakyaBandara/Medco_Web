<?php 
	require 'dbconnect.php';


	if(isset($_POST['id1'],$_POST['id2'])) {
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT relmsd.ID,MID,shortname FROM relmsd,modules WHERE relmsd.MID=modules.ID and DID = " . $_POST['id1']. " ORDER BY relmsd.ID ASC;");
		$stmt->execute();
		$modules = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($modules);
	}

	if(isset($_POST['itd1'],$_POST['itd2'],$_POST['itd3'])) {
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT relmsd.ID,MID,shortname FROM relmsd,modules WHERE relmsd.MID=modules.ID and DID = " . $_POST['itd1']. " and SID = " . $_POST['itd3']. " ORDER BY relmsd.ID ASC;");
		$stmt->execute();
		$modules = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($modules);
	}

	if(isset($_POST['id6'],$_POST['id7'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM intake35sem1attendace where RELID = (SELECT `ID` FROM `relmsd` WHERE `MID`=\"" . $_POST['id7'] . "\" and DID=" . $_POST['id6'] . ") ORDER BY Date ASC;");
		$stmt->execute();
		$modules = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($modules);
	}

?>