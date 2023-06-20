import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment_2/card_page_screen.dart';

import 'card_button.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "Apple", price: 5),
    Product(name: "orange", price: 10),
    Product(name: "watermelon", price: 30),
    Product(name: "blackberry", price: 7),
    Product(name: "Mango", price: 20),
    Product(name: "Red currant", price: 5),
    Product(name: "Grape", price: 15),
    Product(name: "Fig", price: 20),
    Product(name: "Guava", price: 25),
    Product(name: "Dates", price: 30),
    Product(name: "Peach", price: 40),
  ];

  void _showCongratulationsDialog(String productName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Congratulations!"),
          content: Text("You've bought 5 $productName!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ok"),
            ),
          ],
        );
      },
    );
  }

  int getTotalBoughtProducts() {
    int total = 0;
    for (var product in products) {
      total += product.counter;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ProductList"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                products[index].name,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                "\$${products[index].price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16),
              ),
              trailing: CounterButton(
                onPressed: () {
                  setState(() {
                    products[index].incrementCounter();
                    if (products[index].counter == 5) {
                      _showCongratulationsDialog(products[index].name);
                    }
                  });
                },
                count: products[index].counter,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CardPageScreen(totalProduct: getTotalBoughtProducts())));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}


