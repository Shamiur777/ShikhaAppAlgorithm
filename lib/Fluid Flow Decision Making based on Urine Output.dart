import 'dart:io';

void main() {
  String TargetUrineOutput = '0.5 – 1 mL/hour/kg';
  double? lowerLimit; //lower limit of the target urine output
  int? upperLimit; //upper limit of the target urine output

  //in practice, the user will select from a dropdown menu from two options
  //1.0.5 – 1 mL/hour/kg    2. 1 – 2 mL/hour/kg
  if(TargetUrineOutput == '0.5 – 1 mL/hour/kg'){
    lowerLimit = 0.5;
    upperLimit = 1;
  }
  else {
    lowerLimit = 1;
    upperLimit = 2;
  }

  int DropFactor = 15;
  //in practice, the user will select from a dropdown menu from two options
  //1. 15 Drops = 1 mL (Commonly Used) 2. 60 drops = 1 mL (Micro burette)
  double BW = 80; //Body Weight in kg, will be taken input
  double UrineOutput = 120; //current urine output of the patient in mL
  //will be taken input
  double previousFlowRate = 2583; //Previous IV Fluid Flow Rate in mL/hour
  //will be taken input
  double? Z; //new fluid flow rate in mL/hour
  double Z1; //new fluid flow rate in drops/minute
  int? z;
  int? z1;
  if (BW <= 0 || previousFlowRate <= 0 || UrineOutput < 0) {
    print("Invalid Input!");
    exit(0);
    //Body Weight and previous flow rate cannot be less than or equal to zero,
    //urine output cannot be negative
  }
  if (UrineOutput < lowerLimit * BW){
    Z = previousFlowRate + previousFlowRate/3;
  }
  else if (UrineOutput >= lowerLimit * BW && UrineOutput <= upperLimit*BW){
    Z = previousFlowRate;
  }
  else {
    Z = previousFlowRate - previousFlowRate/3;
  }
  Z1 = Z * DropFactor /60;
  z = Z.round();
  z1 = Z1.round();
  print("New IV Fluid Flow rate: $z mL/hour or $z1 drops/minute");

}