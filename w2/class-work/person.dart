// class Ticket {
//
// }
// enum TravelClass {city, country}
// enum Gender {M, F, O}
// class Passenger {
//   String firstName;
//   String lastName;
//
//   Passenger({required this.firstName, required this.lastName});
//   String getFullName(){
//      return firstName + " " + lastName;
//   }
//
// }
//
// void main (){
//   Passenger p1 = Passenger(firstName: "mae ah nang", lastName: "mae ah nang");
//   print(p1.getFullName());
// }

//
// class Point {
//   int x, y;
//   Point(this.x, this.y);
//   Point operator + (Point other){
//     return Point((x + other.x), y + other.y );
//   }
//   @override
//   String toString() => "$x, $y";
// }
// main (){
//   var p1 = Point(2, 3);
//   var p2 = Point(4, 5);
//   final result = p1 + p2;
//   print(result);
// }


//
// // enum Distance  {cms, meters, kms}
// class Distance{
//   double cms; // assume bedefual is cms
//   Distance (this.cms);
//   // Distance  operator + (Distance kms){
//   //   return Distance(length + (kms.length * 1000));
//   // }
//   Distance.kms(Distance kms){
//     return Distance(cms + (kms.cms * 1000));
//   }
//   Distance.metters(int length) => length * 100;
//   Distance.kms(int length) => length * 1000;
// }
// main (){
//   Distance d1 = Distance.kms(3.4);
//   Distance d2 = Distance(3);
//   print((d1 + d2).kms);
//
// }






