<?php 

	require 'dbconnect.php';
	require 'uploadFile.php';
	// require 'sendMail.php';

	function creat_user($nic,$Password,$type){
        $db = new DbConnect;
		$hashed = password_hash($Password,PASSWORD_BCRYPT);
        $sql = "INSERT INTO  `users`( `Username`, `Password`, `Type`) VALUES ('$nic','$hashed','$type')";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
            $conn->exec($sql);
            $last_id = $conn->lastInsertId();
            return $last_id;
        }
    }

	if(isset($_POST['loadPhamacy'])) {
		$db = new DbConnect;
		if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
		$stmt = $conn->prepare("SELECT * FROM `pharmacy`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
		}
	}

	if(isset($_POST['loadDoctor'])) {
		$db = new DbConnect;
		if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
		$stmt = $conn->prepare("SELECT * FROM `doctor`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
		}
	}

	if(isset($_POST['loadDrug'])) {
		$db = new DbConnect;
		if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {

		$stmt = $conn->prepare("SELECT * FROM `drugs`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
		}
	}

	if(isset($_POST['loadPatient'])) {
		$db = new DbConnect;
		if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {

		$stmt = $conn->prepare("SELECT * FROM `member`;");
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
		}
	}

	if(isset($_POST['addDoctor'])) {
		$txtDocName = $_POST['txtDocName'];
        $txtMedicalRegID = $_POST['txtMedicalRegID'];
        $txtDocNIC = $_POST['txtDocNIC'];
		$txtDocEmail = $_POST['txtDocEmail'];
		$txtDocPhone = $_POST['txtDocPhone'];
        $Password = randomPassword();
        $UniqID = "DOC_".uniqid();


        $LID = creat_user($txtDocEmail,$Password,3);
        $db = new DbConnect;
        $sql = "INSERT INTO  `doctor`( `D_name`, `phone`, `medicalRegID`, `nic`, `email`, `QRID`, `LID`) VALUES ('$txtDocName','$txtDocPhone','$txtMedicalRegID','$txtDocNIC','$txtDocEmail', '$UniqID', '$LID');";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            // $desc = "<h1>Welcome To Medco System</h1><br><p>Your username is - ".$txtDocEmail."<p>Your Password is - ".$Password."</p><br><br><p>Please use this credientials to log into your Medco account</p><p>Thank You!</p>";
            // sendmail($txtDocEmail,'New Doctor Account Created',$desc);

            echo '<script language="javascript">
			window.alert("Succesfully added!");
			window.location.href = "../admin_add_doctor.html"
			</script>';
			exit();
        }
	}

	if(isset($_POST['addPharmacy'])) {
		$txtPharName = $_POST['txtPharName'];
		$txtPharEmail = $_POST['txtPharEmail'];
        $txtPharRegId = $_POST['txtPharRegId'];
        $txtPharLocation = $_POST['txtPharLocation'];
		$txtPharPhone = $_POST['txtPharPhone'];
        $Password = randomPassword();
        $UniqID = "PHA_".uniqid();

        $LID = creat_user($txtPharEmail,$Password,2);
        $db = new DbConnect;
        $sql = "INSERT INTO `pharmacy`( `Ph_name`, `Ph_reg`, `LID`, `location`, `phone`, `QRID`, `ph_email`) VALUES ('$txtPharName','$txtPharRegId','$LID','$txtPharLocation','$txtPharPhone','$UniqID','$txtPharEmail');";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            // $desc = "<h1>Welcome To Medco System</h1><br><p>Your username is - ".$txtPharEmail."<p>Your Password is - ".$Password."</p><br><br><p>Please use this credientials to log into your Medco account</p><p>Thank You!</p>";
            // sendmail($txtPharEmail,'New Pharmacy Account Created',$desc);

            echo '<script language="javascript">
			window.alert("Succesfully added!");
			window.location.href = "../admin_add_pharmacy.html"
			</script>';
			exit();
        }
	}


	if(isset($_POST['addMedicine'])) {
		$txtDrugName = $_POST['txtDrugName'];
		$txtDrugManComp = $_POST['txtDrugManComp'];
        $txtDrugStr = $_POST['txtDrugStr'];
        $txtDrugDes = $_POST['txtDrugDes'];

        $file = $_FILES['txtDrugImg'];
		$allowd = array('jpg', 'jpeg', 'png');
		$fileDestination = '../../Images';
		$txtDrugImg = uploadfile($file,$allowd,$fileDestination);

        $db = new DbConnect;
        $sql = "INSERT INTO `drugs`( `drg_name`, `manf_comp`, `drg_strength`, `drg_Desc`, `drg_Img`) VALUES ('$txtDrugName','$txtDrugManComp','$txtDrugStr','$txtDrugDes','$txtDrugImg');";

        if(!$conn = $db->connect()){
            echo "SQL Error";
            exit();
        }
        else {
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            echo '<script language="javascript">
			window.alert("Succesfully added!")
	        window.location.href = "../admin_add_medicine.html"
			</script>';

			exit();
        }
	}

    function randomPassword() {
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }
?>