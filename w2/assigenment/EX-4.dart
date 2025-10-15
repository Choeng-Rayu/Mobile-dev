// Shop Management System

enum Category { food, electronic, material }
enum Payment { cash, ABA, ACLEDA, other }
enum OrderType { pickup, delivery }


class Product {
  final int id;
  final String name;
  final Category category;
  final double price;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
  });

  double get total => price * quantity;

  @override
  String toString() => '$name (x$quantity) - \$${price.toStringAsFixed(2)} each, Total: \$${total.toStringAsFixed(2)}';
}

class Order {
  final String date;
  final OrderType type;
  final List<Product> products;
  final String? address; // Nullable for pickup orders

  Order({
    required this.date,
    required this.type,
    required this.products,
    this.address,
  });

  double get totalAmount {
    double sum = 0;
    for (var p in products) {
      sum += p.total;
    }
    return sum;
  }

  @override
  String toString() {
    final productList = products.map((p) => '  - ${p.toString()}').join('\n');
    return '''
Order Type: ${type.name}
Date: $date
${address != null ? 'Address: $address\n' : ''}
Products:
$productList
Total: \$${totalAmount.toStringAsFixed(2)}
''';
  }
}


class History {
  final Payment paymentType;
  final String paidDate;
  final List<Order> orders;

  History({
    required this.paymentType,
    required this.paidDate,
    required this.orders,
  });

  double get totalPaid {
    double sum = 0;
    for (var o in orders) {
      sum += o.totalAmount;
    }
    return sum;
  }

  @override
  String toString() {
    final orderList = orders.map((o) => o.toString()).join('\n');
    return '''
Payment: ${paymentType.name}
Paid Date: $paidDate
Orders:
$orderList
Total Paid: \$${totalPaid.toStringAsFixed(2)}
''';
  }
}


class CustomerAccount {
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final int phone;
  final List<History> history = [];

  CustomerAccount({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phone,
  });

  void addHistory(History h) => history.add(h);

  void showAccountSummary() {
    print('Customer: $firstName $lastName');
    print('Email: $email | Phone: $phone');
    if (history.isEmpty) {
      print('No purchase history yet.');
    } else {
      print('Purchase History:\n');
      for (var h in history) {
        print(h);
      }
    }
  }
}

// ---------------- Main Test ----------------
void main() {
  // Create sample products
  var p1 = Product(id: 1, name: 'Laptop', category: Category.electronic, price: 850, quantity: 1);
  var p2 = Product(id: 2, name: 'Rice', category: Category.food, price: 1.2, quantity: 50);
  var p3 = Product(id: 3, name: 'Cement', category: Category.material, price: 5.5, quantity: 10);

  // Create orders
  var order1 = Order(date: '2025-10-15', type: OrderType.pickup, products: [p1, p2]);
  var order2 = Order(date: '2025-10-16', type: OrderType.delivery, products: [p3], address: 'Phnom Penh');

  // Payment history
  var history = History(paymentType: Payment.ABA, paidDate: '2025-10-16', orders: [order1, order2]);

  // Customer
  var customer = CustomerAccount(
    firstName: 'Rayu',
    lastName: 'Choeng',
    password: '12345',
    email: 'rayu@example.com',
    phone: 969983479,
  );

  // Add history
  customer.addHistory(history);

  // Display summary
  customer.showAccountSummary();
}



