class Point {
 // In Dart, the final keyword ensures a variable can be set only once (like const but at runtime).
  final double x;
  final double y;
  Point(this.x, this.y);
  Point translate(int dx, int dy) {return Point(x + dx, y + dy);}
  @override
  String toString(){
    return "Point(x: $x, y: $y";
  }
}

void main(){
  var p1 = Point (2, 3);
  print("Point 1: $p1");
  final p2 = p1.translate(1, 2);
  print("Point 2: $p2");
  print("Check Point 1 again: $p1");
}