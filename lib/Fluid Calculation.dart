import 'dart:io';

void main() {
  double TBSA = 50;
  //in practice, the TBSA value will be imported from the Lund Browder chart
  String PatientType = "Adult";
  //in practice, this will be imported from the selection previously done
  //on the Categorization page.
  double N = 500; //Fluid already given to the patient (mL), will be taken input
  double BW = 80; //Body Weight in kg, will be taken input
  double? T;
  //The Amount of Fluid the Patient needs
  //Will be Calculated
  double? M;
  //The amount of maintenance fluid a child patient may need
  // Will be Calculated
  int? t;
  int? m;
  if (BW <= 0 || N < 0){
    print("Invalid Input!");
    exit(0);
    //Since Body Weight cannot be less than or equal to zero
    //and Amount of fluid already given cannot be less than zero
    //Inputting invalid input will cause the app to show an error, and
    //no further calculation will be done.
  }

  if (PatientType == 'Adult') {
    if (TBSA <= 15) {
      print(
          "This patient may not need fluid resuscitation. "
              "Please use clinical judgement to proceed further.");
      exit(0);
    }

    else {
      if (N >= 4*BW*TBSA){
        print("The Necessary amount of fluid is already given. "
            "Please use clinical judgement to proceed further.");
        exit(0);
      }
      else{
        T = 4*BW*TBSA - N;
        t = T.round();
        print("The Amount of Fluid to be given: $t mL");
      }
    }
  }

  else if (PatientType == 'Child') {
    if (TBSA <= 10) {
      print(
          "This patient may not need fluid resuscitation. "
              "Please use clinical judgement to proceed further.");
      exit(0);
    }
    else {
      if (BW <= 10) {
        M = BW*100;
      }
      else if (BW > 10 && BW <=20) {
        M = 1000 + (BW-10)*50;
      }
      else {
        M = 1500 + (BW-20)*20;
      }
      if (N >= 4*BW*TBSA){
      print("The Necessary amount of fluid is already given. "
      "Please use clinical judgement to proceed further.");
      exit(0);
      }
      else{
      T = 4*BW*TBSA - N;
      t = T.round();
      m = M.round();
      print("The Amount of Fluid to be given: $t mL");
      print("The Amount of Maintenance Fluid to be given: $m mL");
      }
    }
  }
}