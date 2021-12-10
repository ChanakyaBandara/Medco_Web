<?php 
	require 'dbconnect.php';

	if(isset($_POST['loadPrescription'])) {

		$PHID = $_POST['loadPrescription'];
		
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT `PQID`,`Pre_ID`, `name`, `Pre_Date`, `timestamp` FROM `prescription`,`phamacy_queue`,`member` WHERE phamacy_queue.PREID = prescription.Pre_ID AND `member`.`MID`= prescription.MID AND phamacy_queue.PHID = '$PHID' ;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

	if(isset($_POST['loadOders'])) {

		$PHID = $_POST['loadOders'];
		
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

	if(isset($_POST['addCheckout']) && isset($_POST['txtPresID']) && isset($_POST['txtCost']) && isset($_POST['txtPHID'])){
		
		$ref = $_POST['txtRef'];
        $cost = $_POST['txtCost'];
        $phid = $_POST['txtPHID'];
		$presid = $_POST['txtPresID'];

        $db = new DbConnect;
        $sql = "INSERT INTO `oders`(`reference`, `Cost`, `PHID`, `PID`) VALUES ('$ref','$cost','$phid','$presid')";
		
		if(!$conn = $db->connect()){
			echo'<script language="javascript">
					window.location.href = "../pharmacy_view_prescriptions.html"
					</script>';
					exit();
		}else{
			if($conn->exec($sql)){
				$last_id = $conn->lastInsertId();
				echo '<script language="javascript">
							window.alert("Data Upload Successfull !")
							window.location.href = "../pharmacy_view_history.html"
							</script>';
							exit();
			}
    		
    	}
	}

?>