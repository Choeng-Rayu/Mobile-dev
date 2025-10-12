int sum(int a, int b) => a + b;

// The function is now corrected to print the gender if it's provided.
void getInfo(String name, [String? gender]) {
  if (gender != null) {
    print("Name: $name, Gender: $gender");
  } else {
    print("Name: $name");
  }
}
int square1(int num) => num * num;

void main() {
  Map<String, double> pizzaPrices = {
    "margherita": 5.5,
    "pepperoni":7.5,
    "vegetarian":6.5,
  };


  List<Map<String, String>> books = [
   {'title': '1984', 'author': 'George Orwell'},
   {'title': 'Brave New World', 'author': 'Aldous Huxley'},
   {'title': 'Fahrenheit 451', 'author': 'Ray Bradbury'},
];

  

  Map<String, List<int>> studentGrades = { 
   'Sokan': [90, 85, 75],
   'Sokea': [70, 80, 75],
   'Hay': [95, 92, 89],
  };

Map<String, Map< String, int>> company = {
  'HR': {'employees': 5, 'budget': 20000},
  'IT': {'employees': 10, 'budget': 50000},
  'Marketing': {'employees': 7, 'budget': 30000},
};

 List<List<int>> coordinates = [
    [1, 2],
    [3, 4],
    [5, 6],
 ];
  
  Map<String, Object> productDetails = {
    'id': 101,
    'name': 'Laptop',
    'price': 999.99,
    'inStock': true,
  };

  Set<double> distance = {3.1, 5.5, 10.2, 7.8};
  
  List<int Function(int, int)> operations = [
    (int a, int b) => a + b,
    (int a, int b) => a - b,
    (int a, int b) => a * b,
  ];
  operations.forEach((operation) => print(operation(3, 2)));

Map<String, List<Map<String, Object>>> university = {
  'departments': [
    {
      'name': 'Computer Science',
      'students': [
        {'name': 'Alice', 'age': 20},
        {'name': 'Bob', 'age': 24},
      ]
    },
    {
      'name': 'Mathematics',
      'students': [
        {'name': 'Charlie', 'age': 21},
        {'name': 'Dave', 'age': 23},
      ]
    }
  ]
};

// Iterate through the university map
// university.forEach((k, v) {
//   print("$k: $v");
// });

 // books.forEach((book) => print("Title: ${book["title"]}, Author: ${book["author"]}"));
 //coordinates.forEach((coor) => print(coor));


  // Correctly calls sum() using string interpolation ${...}
  //print("Result = ${sum(2, 2)}");

  //print("--- Testing getInfo function ---");
  
  // Correctly calls getInfo() by itself. This demonstrates omitting the optional argument.
  //getInfo("Rayu");

  // This call demonstrates providing the optional argument.
  //getInfo("Sok", "Male");
  //print( "Square of 4: ${square1(4)}");
}
