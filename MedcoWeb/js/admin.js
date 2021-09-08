function loadPharmacies() {
  $.ajax({
    url: "PHP/admin.php",
    method: "post",
    data: "loadPhamacy=" + 5,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    console.log(result);
    $("#adminViewPhamacyTBL").empty();
    $("#adminViewPhamacyTBL").append(
      //`ph_ID`, `Ph_name`, `Ph_reg`, `LID`, `location`, `phone`
      "<thead><tr><th>Phamacy ID</th><th>Name</th><th>Reg No</th><th>Email</th><th>Location</th><th>Phone</th>"
    );
    result.forEach(function (result) {
      $("#adminViewPhamacyTBL").append(
        "<tr><td>" +
          result.ph_ID +
          "</td><td>" +
          result.Ph_name +
          "</td><td>" +
          result.Ph_reg +
          "</td><td>" +
          result.ph_email +
          "</td><td>" +
          result.location +
          "</td><td>" +
          result.phone +
          "</td></tr>"
      );
    });
    $("#adminViewPhamacyTBL").append("</tbody>");
  });
}

function loadDoctors() {
  $.ajax({
    url: "PHP/admin.php",
    method: "post",
    data: "loadDoctor=" + 5,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    //console.log(result);
    $("#adminViewDoctorTBL").empty();
    $("#adminViewDoctorTBL").append(
      //`DID`, `D_name`, `phone`, `medicalRegID`, `nic`, `email
      "<thead><tr><th>Doctor ID</th><th>Name</th><th>Phone No</th><th>Reg No</th><th>NIC</th><th>Email</th>"
    );
    result.forEach(function (result) {
      $("#adminViewDoctorTBL").append(
        "<tr><td>" +
          result.DID +
          "</td><td>" +
          result.D_name +
          "</td><td>" +
          result.phone +
          "</td><td>" +
          result.medicalRegID +
          "</td><td>" +
          result.nic +
          "</td><td>" +
          result.email +
          "</td></tr>"
      );
    });
    $("#adminViewDoctorTBL").append("</tbody>");
  });
}

function loadMembers() {
  $.ajax({
    url: "PHP/admin.php",
    method: "post",
    data: "loadPatient=" + 5,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    //console.log(result);
    $("#adminViewPatientTBL").empty();
    $("#adminViewPatientTBL").append(
      //`MID`, `name`, `email`, `nic`, `age`, `phone`, `gender`
      "<thead><tr><th>Patient ID</th><th>Name</th><th>Email</th><th>NIC</th><th>Age</th><th>Phone</th><th>Gender</th>"
    );
    result.forEach(function (result) {
      $("#adminViewPatientTBL").append(
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
    $("#adminViewPatientTBL").append("</tbody>");
  });
}

function loadDrugs() {
  $.ajax({
    url: "PHP/admin.php",
    method: "post",
    data: "loadDrug=" + 5,
  }).done(function (result) {
    console.log(result);
    result = JSON.parse(result);
    //console.log(result);
    $("#adminViewDrugTBL").empty();
    $("#adminViewDrugTBL").append(
      //`drg_ID`, `drg_name`, `manf_comp`, `drg_strength`, `drg_Desc`, `drg_Img`
      "<thead><tr><th>Drug ID</th><th>Name</th><th>Manufacture Company</th><th>Strength</th><th>Description</th><th>Image</th>"
    );
    result.forEach(function (result) {
      $("#adminViewDrugTBL").append(
        "<tr><td>" +
          result.drg_ID +
          "</td><td>" +
          result.drg_name +
          "</td><td>" +
          result.manf_comp +
          "</td><td>" +
          result.drg_strength +
          "</td><td>" +
          result.drg_Desc +
          "</td><td>" +
          result.drg_Img +
          "</td></tr>"
      );
    });
    $("#adminViewDrugTBL").append("</tbody>");
  });
}

function getUserName() {
  return "Admin";
}
