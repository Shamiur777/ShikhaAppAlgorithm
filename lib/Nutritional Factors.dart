import 'dart:io';

void main() {
  double TBSA = 50;
  //TBSA will be taken input in practice
  double BW = 80; //Body Weight in kg, will be taken input
  String PatientType = "Adult";
  //in practice, this will be selected from a dropdown menu by the user
  if (BW <= 0 || TBSA < 0){
    print("Invalid Input!");
    exit(0);
    //Body Weight cannot be less than or equal to zero
    //TBSA cannot be negative
  }
  double? requiredCalorie; //required calorie support in kcal
  int? r;
  if (TBSA < 20) {
    print(" Patient may not need calorie support. "
        "Please use clinical judgement to proceed further");
    exit(0);
  }
  else {
    if (PatientType == 'Adult'){
      requiredCalorie = (25 * BW) + (40 * TBSA);
    }
    else {
      requiredCalorie = (60 * BW) + (35 * TBSA);
    }
  }
  r = requiredCalorie.round();
  print("Required Calorie Support: $r kcal");
}