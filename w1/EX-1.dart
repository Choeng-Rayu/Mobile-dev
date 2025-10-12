// Answer on doc file
void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const orders = ["margherita", "pepperoni", "pineapple"];

  // Check if all pizzas exist on the menu
  final invalidItems = orders.where((pizza) => !pizzaPrices.containsKey(pizza)).toList();

  if (invalidItems.isNotEmpty) {
    // Print the first invalid pizza found
    print('${invalidItems.first} pizza is not on the menu');
  } else {
    // Calculate total if all are valid
    final total = orders
        .map((pizza) => pizzaPrices[pizza] ?? 0.0)
        .fold<double>(0.0, (sum, price) => sum + price);

    print('Total: \$${total.toStringAsFixed(0)}');
  }
}


