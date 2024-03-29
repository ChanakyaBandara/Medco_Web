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
      "<thead><tr><th>Reference No</th><th>Name</th><th>Email</th><th>NIC</th><th>Age</th><th>Phone</th><th>Gender</th><th>Timestamp</th></thead>"
    );
    result.forEach(function (result) {
      $("#doctorViewPatientTBL").append(
        '<tr onClick="loadAddPrescription(' +
        result.DQID +
        ')"><td>' +
        result.DQID +
        '</td><td>' +
        result.name +
        '</td><td>' +
        result.email +
        '</td><td>' +
        result.nic +
        '</td><td>' +
        result.age +
        '</td><td>' +
        result.phone +
        '</td><td>' +
        result.gender +
        '</td><td>' +
        result.timestamp +
        '</td></tr>'
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
        '<tr onClick="loadPresciptionItems(' +
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

function loadAddPrescription(DQID) {
  window.location.href = "doctor_add_prescription.html?DQID=" + DQID;
}

function loadQueueMember() {
  const params = new URLSearchParams(window.location.search);
  if (params.has('DQID')) {
    var DQID = params.get("DQID"); $.ajax({
      url: "PHP/doctor.php",
      method: "post",
      data: "loadQueueMember=" + DQID,
    }).done(function (result) {
      //console.log(result);
      result = JSON.parse(result);
      console.log(result);
      document.getElementById("txtPresMID").value = result[0].MID;
      document.getElementById("txtPresDID").value = result[0].DID;
      document.getElementById("txtPresDQID").value = result[0].DQID;
      document.getElementById("txtPresName").value = result[0].name;
      document.getElementById("txtPresAge").value = result[0].age;
      document.getElementById("txtPresGender").value = result[0].gender;

      console.log(document.getElementById("txtPresMID").value);
      console.log(document.getElementById("txtPresDID").value);
    });
  }

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
    //console.log(result);
    document.getElementById("DID").value = result[0].DID;
    document.getElementById("txtDocName").value = result[0].D_name;
    document.getElementById("txtDocEmail").value = result[0].email;
    document.getElementById("txtMedicalRegID").value = result[0].medicalRegID;
    document.getElementById("txtDocNIC").value = result[0].nic;
    document.getElementById("txtDocPhone").value = result[0].phone;
    generateQR(result[0].QRID);
  });
}

function loadDrugs() {
  var DID = getDID();
  $.ajax({
    url: "PHP/doctor.php",
    method: "post",
    data: "loadDrugs=" + DID,
  }).done(function (result) {
    //console.log(result);
    result = JSON.parse(result);
    $('#txtPresDrugName').empty();
    $('#txtPresDrugName').append('<option value="" disabled selected>Select Drug</option>');
    result.forEach(function (result) {
      $('#txtPresDrugName').append('<option value="' + result.drg_ID + '">' + result.drg_name + ' - ' + result.manf_comp + '</option>');
    });
  });
}

function getDID() {
  return localStorage.getItem("DID");
}

function getUserName() {
  return localStorage.getItem("D_name");
}
