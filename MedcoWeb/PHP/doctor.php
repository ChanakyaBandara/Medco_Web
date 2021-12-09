<?php 
	require 'dbconnect.php';

	function updateQueueStatus($DQID,$status){
        $db = new DbConnect;
        $sql = "UPDATE `doctor_queue` SET `status`='$status' WHERE `DQID`='$DQID';";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
            $conn->exec($sql);
        }
    }

	if(isset($_POST['loadPatient'])) {
		$DID = $_POST['loadPatient'];
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT `DQID`, `name`, `email`, `nic`, `age`, `phone`, `gender`, `timestamp` FROM `member`,`doctor_queue` WHERE `member`.`MID`=`doctor_queue`.`MID` AND `status`=0 AND `DID`='$DID';");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

	if(isset($_POST['loadPrescription'])) {
		$DID = $_POST['loadPrescription'];
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT `Pre_ID`,`member`.`MID` ,`member`.`name` ,`Pre_Date`, `QR_ID` FROM `prescription`,`member` WHERE `prescription`.`MID`=`member`.`MID` AND `prescription`.`DID`='$DID';");
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

	if(isset($_POST['loadQueueMember'])) {
		$DQID = $_POST['loadQueueMember'];
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT `doctor_queue`.`MID`,`doctor_queue`.`DID`,`name`, `age`, `gender`,`DQID` FROM `member`,`doctor_queue` WHERE `doctor_queue`.`MID`=`member`.`MID` AND `DQID`='$DQID';");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}
	
	if(isset($_POST['addPrescription'])){
		echo "<pre>";
		print_r($_POST);
		echo "</pre>";
	}

	if(isset($_POST['addPrescription']) && isset($_POST['txtPresDQID']) && isset($_POST['txtPresMID']) && isset($_POST['txtPresDID'])){
		
		$txtPresQRID = "PRE_".uniqid();
		$txtPresDQID = $_POST['txtPresDQID'];
        $txtPresMID = $_POST['txtPresMID'];
        $txtPresDID = $_POST['txtPresDID'];
		$txtPresDescription = $_POST['txtPresDescription'];
		$tabl_drug=$_POST['tabl_drug'];

        $db = new DbConnect;
        $sql = "INSERT INTO `prescription`(`QR_ID`, `MID`, `DID`) VALUES ('$txtPresQRID','$txtPresMID','$txtPresDID')";
		
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
					updateQueueStatus($txtPresDQID,1);
					echo '<script language="javascript">
							window.alert("Data Upload Successfull !")
							window.location.href = "../doctor_add_prescription.html"
							</script>';
							exit();
				}
			}
    		
    	}
	}

	if(isset($_POST['loadDrugs'])) {
		$db = new DbConnect;
		$conn = $db->connect();

		$stmt = $conn->prepare("SELECT * FROM `drugs`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}
