// class Point {
//   int x;
//   int y;
//
//   Point(this.x, this.y);
//
//   void translate(int dx, int dy) {
//     x += dx;
//     this.y += dy;
//   }
//
//   @override
//   String toString() {
//     return "($x - $y)";
//   }
// }
//
//
// CLass Rectangle {
//   int buttonRight;
//   int topLeft;
//
//   Rectangle({required this.topLeft, required this.buttonRight});
//   int getWidth(() => buttonRight.x)
//
// }
//
//
// main() {
//   Point p1 = Point(5, 5);
//   Point p2 = Point(10, 10);
//
//   print(p1.toString());
// }











enum Direction { north, east, south, west }


void main() {
  print(Direction.values);
  // Output: [Direction.north, Direction.east, Direction.south, Direction.west]

  // You can loop through all directions
  // for (var dir in Direction.values) {
  //   print('${dir.name} at index ${dir.index}');
  // }
}
