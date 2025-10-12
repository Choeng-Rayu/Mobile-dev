// Inferred Dart Types for Data Structures in test.dart
// Using collection literal syntax with type inference

void main() {
  // Example: Explicit type -> Inferred type
  // Map<String, double> pizzaPrices = {...};
  // becomes:
  // var pizzaPrices = <String, double>{...};

  // 1. pizzaPrices - Map from String to double
  var pizzaPrices = <String, double>{
    "margherita": 5.5,
    "pepperoni": 7.5,
    "vegetarian": 6.5,
  };

  // 2. books - List of Maps (String to String)
  var books = <Map<String, String>>[
    {'title': '1984', 'author': 'George Orwell'},
    {'title': 'Brave New World', 'author': 'Aldous Huxley'},
    {'title': 'Fahrenheit 451', 'author': 'Ray Bradbury'},
  ];

  // 3. studentGrades - Map from String to List of int
  var studentGrades = <String, List<int>>{
    'Sokan': [90, 85, 75],
    'Sokea': [70, 80, 75],
    'Hay': [95, 92, 89],
  };

  // 4. company - Map from String to Map (String to int)
  var company = <String, Map<String, int>>{
    'HR': {'employees': 5, 'budget': 20000},
    'IT': {'employees': 10, 'budget': 50000},
    'Marketing': {'employees': 7, 'budget': 30000},
  };

  // 5. coordinates - List of List of int (2D array)

var coordinates = <List<int>>[
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  // 6. productDetails - Map from String to Object (mixed types)
  var productDetails = <String, Object>{
    'id': 101,
    'name': 'Laptop',
    'price': 999.99,
    'inStock': true,
  };

  // 7. distance - Set of double
  var distance = <double>{3.1, 5.5, 10.2, 7.8};

  // 8. university - Complex nested structure
  // Map from String to List of Maps (String to Object)
  var university = <String, List<Map<String, Object>>>{
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

  // 9. operations - List of functions (int, int) -> int
  var operations = <int Function(int, int)>[
    (int a, int b) => a + b,
    (int a, int b) => a - b,
    (int a, int b) => a * b,
  ];

  // Print to verify types are correct
  print("All data structures created with inferred types!");
}
