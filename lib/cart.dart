import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int user_id;
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.user_id, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems); // Copy the cartItems to a mutable list
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // Remove item from the cart
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0.0, (sum, item) {
      double price = (item['price'] is String)
          ? double.tryParse(item['price']) ?? 0.0
          : (item['price'] as double);
      return sum + price;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'CART LIST',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty!', style: TextStyle(fontSize: 18)))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                var item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Image.network(
                      item['image'] ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item['title'] ?? "No title",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Price: \$${(item['price'] is String) ? double.tryParse(item['price'])?.toStringAsFixed(2) : (item['price'] as double).toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        removeItem(index); // Remove item from the cart
                      },
                      icon: const Icon(Icons.remove_circle),
                      color: Colors.redAccent,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total : \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add checkout functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text("Checkout"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
