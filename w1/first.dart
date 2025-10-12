// Given the following map of pizza prices:
 
// const pizzaPrices = {
//   'margherita': 5.5,
//   'pepperoni': 7.5,
//   'vegetarian': 6.5,
// };

// Write a program to calculate the total for a given order.
//  print(pizzaPrices.values.toList().reduce((a, b) => a + b));  // 
//  print(pizzaPrices.values.toList().fold<double>(0.0, (a, b) => a + b));

// For example, given the following order:
// const orders = ['margherita', 'pepperoni'];

// The program should print:
// Total: $13`

// If a pizza is not on the menu, the program should print:
// pineapple pizza is not on the menu

void main(){
    const pizzaPrices = {
        'margherita': 5.5,
        'pepperoni': 7.5,
        'vegetarian': 6.5,
    };
    const orders = ["margherita", "pepperoni", "1"]; // ordered 

        // print(pizzaPrices.entries.where((entry) => ordered.contains(entry.key)).map((entry) => entry.value).fold<double>(0.0, (a, b) => a + b));
        // print(ordered.map((findItemInPizza) => pizzaPrices[findItemInPizza] ?? 0.0 ).fold <double> (0.0, (totalItems, itemOrders) => totalItems + itemOrders));
    // Write a program to calculate the total for a given order.
    // print(pizzaPrices.values.toList().reduce((a, b) => a + b));
    // print(pizzaPrices.values.toList().fold<double>(0.0, (a, b) => a + b));
   final checkPizza = orders.where((pizzaOrdered) => !pizzaPrices.containsKey(pizzaOrdered)).toList();
   if(checkPizza.isNotEmpty){
    print('$checkPizza  pizza is not on the menu');
   }else{
    final total = orders.map((pizzaOrdered) => pizzaPrices[pizzaOrdered] ?? 0.0).fold<double>( 0.0, (sumTotalItems, prices) => sumTotalItems + prices);
    print('Total: \$${total.toStringAsFixed(0)}');
   }
}






// print(pizzaPrices.entries.where((entry) => orders.contains(entry.key)).map((entry) =>             entry.value).fold<double>(0.0, (a, b) => a + b));  // Option 1: using key and value in the entries and using fold instead of reduce method to calculate the value in the mape pizzaPrices 
  
// print(orders.map((findItemInPizza) => pizzaPrices[findItemInPizza] ?? 0.0 ).fold <double> (0.0, (totalItems, itemOrders) => totalItems + itemOrders)); // Option 2: create a new list as map from orders and check it in the pizzaPrices if it null using 0.0 if not using .fold method to calculate the total value.