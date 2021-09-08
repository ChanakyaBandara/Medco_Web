<?php 
	require 'dbconnect.php';

	if(isset($_POST['loadPatient'])) {
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT * FROM `member`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

	if(isset($_POST['loadPrescription'])) {
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT `Pre_ID`,`member`.`MID` ,`member`.`name` ,`Pre_Date`, `QR_ID` FROM `prescription`,`member` WHERE `prescription`.`MID`=`member`.`MID`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

	if(isset($_POST['loadPresciptionItems'])) {
		$PreID =  $_POST['loadPresciptionItems'];
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT `drg_ID`, `drg_name`, `manf_comp`, `drg_strength`, `drg_Desc`, `drg_Img`, `dose` FROM `drugs`,`pre_drg` WHERE drugs.drg_ID=pre_drg.DRID AND pre_drg.PRID ='$PreID'");
		$stmt->execute();
		$rec = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($rec);
	}


	if(isset($_POST['loadDoctor'])) {
		$DID = $_POST['loadDoctor'];
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT * FROM `doctor` WHERE `DID`='$DID';");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}



	if(isset($_POST['addPrescription1'])) {
		$txtPresQRID = $_POST['txtPresQRID'];
		$datePresDate = $_POST['datePresDate'];
        $txtPresMID = $_POST['txtPresMID'];
        $txtPresDID = $_POST['txtPresDID'];
		$tabl_drug=$_POST['tabl_drug'];
		print_r($tabl_drug);

        $db = new DbConnect;
        $sql = "INSERT INTO `prescription`(`Pre_Date`, `QR_ID`, `MID`, `DID`) VALUES ('$datePresDate','$txtPresQRID','$txtPresMID','$txtPresDID')";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
		else {
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            // echo '<script language="javascript">
			// Alert("Succesfully added!");
			// window.location.href = "../admin_add_pharmacy.html"
			// </script>';
			exit();
        }
	}

	if(isset($_POST['addPrescription'])){
	
		
		$txtPresQRID = $_POST['txtPresQRID'];
		$datePresDate = $_POST['datePresDate'];
        $txtPresMID = $_POST['txtPresMID'];
        $txtPresDID = $_POST['txtPresDID'];
		$tabl_drug=$_POST['tabl_drug'];

        $db = new DbConnect;
        $sql = "INSERT INTO `prescription`(`Pre_Date`, `QR_ID`, `MID`, `DID`) VALUES ('$datePresDate','$txtPresQRID','$txtPresMID','$txtPresDID')";

		if(!$conn = $db->connect()){
			echo'<script language="javascript">
					window.location.href = "../doctor_add_prescription.html"
					</script>';
					exit();
		}else{
			if($conn->exec($sql)){
				$last_id = $conn->lastInsertId();
				echo $last_id;
				$sql2 = "INSERT INTO `pre_drg`(`PRID`, `DRID`, `dose`, `Remark`) VALUES ";
				foreach ($tabl_drug as &$drug) {
					$sql2 .= "(" . $last_id . "," . $drug['DRID'] . "," . $drug['dose'] . ",\"" . $drug['Remark'] . "\"),";
				}
				$sql2 = substr_replace($sql2 ,";",-1);
				echo $sql2;
				if(!$conn = $db->connect()){
					echo'<script language="javascript">
							window.alert("Error in Uploding Data ")
							window.location.href = "../doctor_add_prescription.html"
							</script>';
							exit();
				}else{
					$stmt = $conn->prepare($sql2);
					$stmt->execute();
					echo '<script language="javascript">
							window.alert("Data Upload Successfull !")
							window.location.href = "../doctor_add_prescription.html"
							</script>';
							exit();
				}
			}
    		
    	}
	}

	

?>