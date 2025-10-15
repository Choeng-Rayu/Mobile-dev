class Distance {
  final double metter;

  Distance(this.metter);

  Distance.cms(double cms) : metter = cms / 100;

  Distance.kms(double kms) : metter = kms * 1000;

  @override
  String toString() => "$metter metters";

  Distance operator +(Distance other) {
    return Distance(metter + other.metter);
  }

  double convertToMetter() => metter;

  double convertToKms() => metter / 1000;

  double convertToCms() => metter * 100;
}
void main(){
  Distance d1 = Distance.kms(1);
  Distance d2 = Distance.cms(5000);
  print("${(d1 + d2).convertToMetter()}");
}





//
// class Distance {
//   double meters;
//
//   // Default constructor
//   Distance(this.meters);
//   // Named constructor for kilometers
//   Distance.kms(double kms) : meters = kms * 1000;
//
//   // Named constructor for centimeters
//   Distance.cms(double cms) : meters = cms / 100;
//
//   Distance operator + (Distance other){
//     return Distance(meters + other.meters);
//   }
//   @override
//   String toString() => '$meters meters';
//
//   double kms() {
//     return (meters / 1000);
//   }
// }
//
// void main() {
//   var d1 = Distance.kms(1);
//   var d2 = Distance.cms(50000);
//
//   print(d1); // 1000 meters
//   print(d2); // 50 meters
//   print((d1 + d2).kms());
// }
