<?php 
	require 'dbconnect.php';

	if(isset($_POST['loadPrescription'])) {

		$PHID = $_POST['loadPrescription'];
		
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `prescription`,`oders` WHERE prescription.Pre_ID = oders.PID AND oders.PHID = '$PHID' ;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

	if(isset($_POST['loadPharmacy'])) {

		$PHID = $_POST['loadPharmacy'];
		
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `pharmacy` WHERE  ph_ID = '$PHID' ;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}


?>