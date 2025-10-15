// Improved Shop Management System with Better Relationships

enum Category { food, electronic, material }
enum Payment { cash, ABA, ACLEDA, other }
enum OrderType { pickup, delivery }
enum OrderStatus { pending, confirmed, delivered, cancelled }

// ============= SHOP INVENTORY =============
class Product {
  final int id;
  final String name;
  final Category category;
  final double price;
  int stockQuantity; // Available in shop

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stockQuantity,
  });

  bool isAvailable(int requestedQty) => stockQuantity >= requestedQty;

  void decreaseStock(int qty) {
    if (qty <= stockQuantity) {
      stockQuantity -= qty;
    } else {
      throw Exception('Insufficient stock for $name');
    }
  }

  @override
  String toString() => '$name - \$${price.toStringAsFixed(2)} (Stock: $stockQuantity)';
}

// ============= SHOPPING CART =============
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  double get subtotal => product.price * quantity;

  @override
  String toString() => '${product.name} (x$quantity) - \$${product.price.toStringAsFixed(2)} each = \$${subtotal.toStringAsFixed(2)}';
}

class ShoppingCart {
  final List<CartItem> items = [];

  void addProduct(Product product, int quantity) {
    if (!product.isAvailable(quantity)) {
      print('❌ Sorry, only ${product.stockQuantity} ${product.name}(s) available');
      return;
    }

    // Check if product already in cart
    var existingItem = items.where((item) => item.product.id == product.id).firstOrNull;
    if (existingItem != null) {
      existingItem.quantity += quantity;
    } else {
      items.add(CartItem(product: product, quantity: quantity));
    }
    print('✅ Added $quantity x ${product.name} to cart');
  }

  void removeProduct(int productId) {
    items.removeWhere((item) => item.product.id == productId);
  }

  double get total {
    return items.fold(0, (sum, item) => sum + item.subtotal);
  }

  void clear() => items.clear();

  bool get isEmpty => items.isEmpty;

  void showCart() {
    if (isEmpty) {
      print('🛒 Your cart is empty');
      return;
    }
    print('🛒 Shopping Cart:');
    for (var item in items) {
      print('  - $item');
    }
    print('  Total: \$${total.toStringAsFixed(2)}');
  }
}

// ============= ORDER MANAGEMENT =============
class Order {
  final String orderId;
  final String orderDate;
  final OrderType type;
  final List<CartItem> items; // Items ordered (snapshot from cart)
  final String? deliveryAddress;
  OrderStatus status;
  Payment? paymentMethod;
  String? paymentDate;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.type,
    required this.items,
    this.deliveryAddress,
    this.status = OrderStatus.pending,
    this.paymentMethod,
    this.paymentDate,
  });

  double get totalAmount => items.fold(0, (sum, item) => sum + item.subtotal);

  void processPayment(Payment method, String date) {
    paymentMethod = method;
    paymentDate = date;
    status = OrderStatus.confirmed;
    
    // Decrease stock when payment is confirmed
    for (var item in items) {
      item.product.decreaseStock(item.quantity);
    }
  }

  @override
  String toString() {
    final itemsList = items.map((item) => '    - $item').join('\n');
    return '''
  📦 Order ID: $orderId
  📅 Date: $orderDate
  🚚 Type: ${type.name}
  ${deliveryAddress != null ? '📍 Address: $deliveryAddress\n' : ''}  Status: ${status.name}
  ${paymentMethod != null ? '💳 Payment: ${paymentMethod!.name} on $paymentDate\n' : ''}  Items:
$itemsList
  💰 Total: \$${totalAmount.toStringAsFixed(2)}''';
  }
}

// ============= CUSTOMER ACCOUNT =============
class CustomerAccount {
  final String customerId;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String phone;
  final ShoppingCart cart = ShoppingCart();
  final List<Order> orderHistory = [];

  CustomerAccount({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phone,
  });

  // Add products to cart
  void addToCart(Product product, int quantity) {
    cart.addProduct(product, quantity);
  }

  // Checkout and create order
  Order? checkout(OrderType orderType, {String? deliveryAddress}) {
    if (cart.isEmpty) {
      print('❌ Cannot checkout. Cart is empty!');
      return null;
    }

    if (orderType == OrderType.delivery && deliveryAddress == null) {
      print('❌ Delivery address required for delivery orders!');
      return null;
    }

    // Create order from cart
    var order = Order(
      orderId: 'ORD${DateTime.now().millisecondsSinceEpoch}',
      orderDate: DateTime.now().toString().substring(0, 10),
      type: orderType,
      items: List.from(cart.items), // Copy cart items
      deliveryAddress: deliveryAddress,
    );

    orderHistory.add(order);
    cart.clear();
    
    print('✅ Order created successfully! Order ID: ${order.orderId}');
    print('⏳ Please complete payment to confirm order.');
    return order;
  }

  // Pay for a specific order
  void payForOrder(String orderId, Payment paymentMethod) {
    var order = orderHistory.where((o) => o.orderId == orderId).firstOrNull;
    if (order == null) {
      print('❌ Order not found!');
      return;
    }

    if (order.status != OrderStatus.pending) {
      print('❌ Order already processed!');
      return;
    }

    order.processPayment(paymentMethod, DateTime.now().toString().substring(0, 10));
    print('✅ Payment successful! Order confirmed.');
  }

  void showOrderHistory() {
    print('\n' + '=' * 60);
    print('👤 Customer: $firstName $lastName');
    print('📧 Email: $email | 📱 Phone: $phone');
    print('=' * 60);
    
    if (orderHistory.isEmpty) {
      print('📭 No orders yet.');
    } else {
      print('📜 Order History:\n');
      for (var order in orderHistory) {
        print(order);
        print('---');
      }
      
      double totalSpent = orderHistory
          .where((o) => o.status == OrderStatus.confirmed)
          .fold(0, (sum, o) => sum + o.totalAmount);
      print('💎 Total Spent: \$${totalSpent.toStringAsFixed(2)}');
    }
    print('=' * 60);
  }
}

// ============= SHOP SYSTEM =============
class Shop {
  final String name;
  final List<Product> inventory = [];

  Shop({required this.name});

  void addProduct(Product product) {
    inventory.add(product);
  }

  Product? getProduct(int id) {
    return inventory.where((p) => p.id == id).firstOrNull;
  }

  void showInventory() {
    print('\n🏪 $name - Product Inventory:');
    for (var product in inventory) {
      print('  ${product.id}. $product');
    }
    print('');
  }
}

// ============= MAIN DEMO =============
void main() {
  print('🏪 Welcome to Shop Management System\n');

  // 1. Create Shop and Add Products to Inventory
  var shop = Shop(name: 'Tech & More Store');
  
  var laptop = Product(id: 1, name: 'Laptop', category: Category.electronic, price: 850, stockQuantity: 5);
  var rice = Product(id: 2, name: 'Rice (kg)', category: Category.food, price: 1.2, stockQuantity: 100);
  var cement = Product(id: 3, name: 'Cement (bag)', category: Category.material, price: 5.5, stockQuantity: 50);
  var phone = Product(id: 4, name: 'Smartphone', category: Category.electronic, price: 450, stockQuantity: 10);

  shop.addProduct(laptop);
  shop.addProduct(rice);
  shop.addProduct(cement);
  shop.addProduct(phone);

  shop.showInventory();

  // 2. Create Customer Account
  var customer = CustomerAccount(
    customerId: 'CUST001',
    firstName: 'Rayu',
    lastName: 'Choeng',
    password: 'secure123',
    email: 'rayu@example.com',
    phone: '+855969983479',
  );

  print('👤 Customer registered: ${customer.firstName} ${customer.lastName}\n');

  // 3. Customer Shops - Add to Cart
  print('🛍️  Shopping Session Started\n');
  customer.addToCart(laptop, 1);
  customer.addToCart(rice, 50);
  customer.addToCart(phone, 2);
  print('');
  
  customer.cart.showCart();

  // 4. Checkout - Create Order
  print('\n💳 Proceeding to Checkout...\n');
  var order1 = customer.checkout(OrderType.delivery, deliveryAddress: 'Phnom Penh, Cambodia');

  // 5. Pay for Order
  if (order1 != null) {
    print('\n💰 Processing Payment...\n');
    customer.payForOrder(order1.orderId, Payment.ABA);
  }

  // 6. Shop Again
  print('\n\n🛍️  New Shopping Session\n');
  customer.addToCart(cement, 10);
  customer.cart.showCart();
  
  var order2 = customer.checkout(OrderType.pickup);
  if (order2 != null) {
    customer.payForOrder(order2.orderId, Payment.cash);
  }

  // 7. View Order History
  customer.showOrderHistory();

  // 8. Check Updated Inventory
  shop.showInventory();
}
