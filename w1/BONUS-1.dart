enum Direction { north, east, south, west } // to access each element use .name, .index, .values

void main() {
  // Initial position {7, 3} and facing north
  // enum Direction { north, east, south, west }; // to access each element use .name, .index, .values
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;
  print(direction.index);

  // Example instruction sequence
  const instructions = "L";
  // const instructions = "RAALAL";
  // Process the instructions and get the final position and direction
  for (int i = 0; i < instructions.length; i++ ){
    String movement = instructions[i];

    if(movement == "R"){
      direction = Direction.values[(direction.index +1) % 4];
      print(direction.index);
    }else if(movement == "L"){
      direction = Direction.values[(direction.index + 3) % 4];
    }else if (movement == "A") {
      if(direction == Direction.north) y = y + 1;
      else if( direction == Direction.east) x = x + 1;
      else if (direction == Direction.west) x = x - 1;
      else if ( direction == Direction.south) y  = y - 1 ;
      // the below comment is in advance way generate by AI review by me (still not clear to understand)
      // final movements = {
      // Direction.north: (0, 1),
      // Direction.east: (1, 0),
      // Direction.south: (0, -1),
      // Direction.west: (-1, 0),
      // };
      // final (dx, dy) = movements[direction]!;
      // x += dx;
      // y += dy;
    }else print("Invalid Instruction");

  }

  // Print the final position and direction
  print("Final position:  $x, $y");
  print("Facing:  ${direction.name}");
}
