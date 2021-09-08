function loadPatient() {
  var DID = getDID();
  $.ajax({
    url: "PHP/doctor.php",
    method: "post",
    data: "loadPatient=" + DID,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    //console.log(result);
    $("#doctorViewPatientTBL").empty();
    $("#doctorViewPatientTBL").append(
      //`MID`, `name`, `email`, `nic`, `age`, `phone`, `gender`
      "<thead><tr><th>Patient ID</th><th>Name</th><th>Email</th><th>NIC</th><th>Age</th><th>Phone</th><th>Gender</th></thead>"
    );
    result.forEach(function (result) {
      $("#doctorViewPatientTBL").append(
        "<tr><td>" +
          result.MID +
          "</td><td>" +
          result.name +
          "</td><td>" +
          result.email +
          "</td><td>" +
          result.nic +
          "</td><td>" +
          result.age +
          "</td><td>" +
          result.phone +
          "</td><td>" +
          result.gender +
          "</td></tr>"
      );
    });
    $("#doctorViewPatientTBL").append("</tbody>");
  });
}

function loadPrescription() {
  var DID = getDID();
  $.ajax({
    url: "PHP/doctor.php",
    method: "post",
    data: "loadPrescription=" + DID,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    //console.log(result);
    $("#doctorViewPrescriptionTBL").empty();
    $("#doctorViewPrescriptionTBL").append(
      //`member`.`MID` ,`member`.`name` ,`Pre_Date`, `QR_ID`
      "<thead><tr><th>Patient ID</th><th>Name</th><th>Date</th><th>QRID</th></thead>"
    );
    result.forEach(function (result) {
      $("#doctorViewPrescriptionTBL").append(
        '<tr  onClick="loadPresciptionItems(' +
          result.Pre_ID +
          ')"><td>' +
          result.MID +
          "</td><td>" +
          result.name +
          "</td><td>" +
          result.Pre_Date +
          "</td><td>" +
          result.QR_ID +
          "</td></tr>"
      );
    });
    $("#doctorViewPrescriptionTBL").append("</tbody>");
  });
}

function loadPresciptionItems(pre_id) {
  console.log(pre_id);
  $.ajax({
    url: "PHP/doctor.php",
    method: "post",
    data: "loadPresciptionItems=" + pre_id,
  }).done(function (result) {
    //console.log(result);
    result = JSON.parse(result);
    console.log(result);

    $("#tblDrg").empty();

    result.forEach(function (result) {
      $("#tblDrg").append(
        "<tr><td>" +
          result.drg_ID +
          "</td><td>" +
          result.drg_name +
          "</td><td>" +
          result.manf_comp +
          "</td><td>" +
          result.drg_strength +
          "</td><td>" +
          result.dose +
          "</td></tr>"
      );
    });

    modal.style.display = "block";
  });
}

function loadDoctor() {
  var DocID = getDID();
  $.ajax({
    url: "PHP/doctor.php",
    method: "post",
    data: "loadDoctor=" + DocID,
  }).done(function (result) {
    //console.log(result);
    result = JSON.parse(result);
    console.log(result);
    document.getElementById("DID").value = result[0].DID;
    document.getElementById("txtDocName").value = result[0].D_name;
    document.getElementById("txtDocEmail").value = result[0].email;
    document.getElementById("txtMedicalRegID").value = result[0].medicalRegID;
    document.getElementById("txtDocNIC").value = result[0].nic;
    document.getElementById("txtDocPhone").value = result[0].phone;
    generateQR(result[0].QRID);
  });
}

function getDID() {
  return localStorage.getItem("DID");
}

function getUserName() {
  return localStorage.getItem("D_name");
}
