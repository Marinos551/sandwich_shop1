import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Sandwich Shop App',
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      // The bit that you need to update starts from here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OrderItemDisplay(5, 'Footlong', isFootlong: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => print('Add button pressed!'),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => print('Remove button pressed!'),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
      // The bit that you need to update ends here
    ),
  );
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
        // Add this temporary line to see debugging in action
        print('Current quantity: $_quantity');
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              'Footlong',
              isFootlong: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _quantity < widget.maxQuantity ? _increaseQuantity : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Add'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _quantity > 0 ? _decreaseQuantity : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;
  final bool isFootlong;

  const OrderItemDisplay(
    this.quantity,
    this.itemType, {
    super.key,
    required this.isFootlong,
  });

  @override
  Widget build(BuildContext context) {
    final sandwichType = isFootlong ? 'Footlong' : 'Six-inch';
    return Text(
      '$quantity $sandwichType sandwich(es): ${'🥪' * quantity}',
      style: const TextStyle(fontSize: 16, color: Colors.black),
      textAlign: TextAlign.center,
    );
  }
}
