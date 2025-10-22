import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: Center(
          child: Container(
            width: 350,       // Bigger container width
            height: 200,      // Bigger container height
            color: Colors.blue,
            padding: const EdgeInsets.all(10), // Add padding so text doesn’t touch edges
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space widgets evenly horizontally
              crossAxisAlignment: CrossAxisAlignment.center,    // Center vertically
              children: [
                OrderItemDisplay(3, 'Footlong'),
                OrderItemDisplay(5, 'Six-inch'),
                OrderItemDisplay(2, 'Wrap'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$quantity $itemType sandwich(es): ${'🥪' * quantity}',
      style: const TextStyle(fontSize: 16, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
