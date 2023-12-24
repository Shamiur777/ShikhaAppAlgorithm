void main(){

  double TBSA = 50;
  //in practice, the TBSA will be calculated from the Lund Browder chart
  String PatientType = "Adult";
  //in practice, this will be selected by the user from a dropdown menu
  //from two options: Adult and Child
  String? Category;
  if (PatientType == 'Adult') {
    if (TBSA < 15){
      Category = 'Outpatient';
    }

    else if (TBSA >= 15 && TBSA <=30) {
      Category = 'Inpatient for Routine Care';
    }
    else if (TBSA > 30 && TBSA <=50) {
      Category = 'Critical but Salvageable. May need ICU or HDU';
    }
    else if (TBSA < 50 && TBSA <70){
      Category = 'Critical but Unpredictable Outcome. May need HDU';
    }
    else {
      Category = 'Unsalvageable, Comfort Care';
    }
  }

  else if (PatientType == 'Child') {
    if (TBSA < 10){
      Category = 'Outpatient';
    }

    else if (TBSA >= 10 && TBSA <=25) {
      Category = 'Inpatient for Routine Care';
    }
    else if (TBSA > 25 && TBSA <=50) {
      Category = 'Critical but Salvageable. May need ICU or HDU';
    }
    else if (TBSA < 50 && TBSA <70){
      Category = 'Critical but Unpredictable Outcome. May need HDU';
    }
    else {
      Category = 'Unsalvageable, Comfort Care';
    }
  }

  print(Category);

}


