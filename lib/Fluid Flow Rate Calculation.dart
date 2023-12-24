import 'dart:io';

void main() {
  int nh = 5; //number of hours since burn
  int nm = 0; //number of minutes since burn
  if (nh < 0 || nm < 0) {
    print("Invalid Input!");
    exit(0);
    //number of hours or minutes since burn cannot be negative
  }
  String PatientType = "Adult";
  //in practice, this will be imported from the selection previously done
  //on the Categorization page.
  double S = nh + nm/60; //converts the time to only hours.
  int DropFactor = 15;
  //in practice, the user will select from a dropdown menu from two options
  //1. 15 Drops = 1 mL (Commonly Used) 2. 60 drops = 1 mL (Micro burette)
  double? X; //Starting IV Flow Rate in mL/hour
  double? X1; //Starting IV Flow Rate in drops/minute
  double? Y; //Flow Rate after 16 hours in mL/hour
  double? Y1; //Flow Rate after 16 hours in drops/minute
  int? x;
  int? y;
  int? x1;
  int? y1;
  int T = 15500; //Amount of Resuscitation fluid to be given
  // in practice, this value will be imported from the fluid calculation part
  if (S<8) {
    X = T / (2 * (8 - S));
    X1 = X * DropFactor / 60 ;
    Y = T/32;
    Y1 = Y * DropFactor / 60;
    x = X.round();
    y = Y.round();
    x1 = X1.round();
    y1 = Y1.round();
    print("Starting IV Flow Rate: $x mL/hour or $x1 drops/minute");
    print("IV Flow Rate for the next 16 hours: $y mL/hour or $y1 drops/minute");
    print("The given flow rate may need to be updated based on urine output. "
        "Please use clinical judgement");
    if (PatientType == 'Child') {
      print("This flow rate is only applicable for Resuscitation fluid. "
          "For Maintenance fluid flow rate, please use clinical judgement");
    }
  }

  else if (S >= 8 && S <= 24){
    double remainingTime = 24-S;
    X = T / remainingTime;
    X1 = X * DropFactor / 60 ;
    x = X.round();
    x1 = X1.round();
    print("Flow Rate for the next $remainingTime hours:");
    print("$x mL/hour or $x1 drops/minute");
    print("The given flow rate may need to be updated based on urine output. "
        "Please use clinical judgement");
    if (PatientType == 'Child') {
      print("This flow rate is only applicable for Resuscitation fluid. "
          "For Maintenance fluid flow rate, please use clinical judgement");
    }
  }

  else {
    print("The given flow rate may need to be updated based on urine output. "
        "Please use clinical judgement.");
    exit(0);
    //if the golden hour has already passed,
    // the app will do no further calculations.
  }






}

