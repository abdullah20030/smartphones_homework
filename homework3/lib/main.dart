import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Product Listing")),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            ProductBox(
              name: "iPhone",
              description: "iPhone is the stylish phone",
              price: 1000,
              image: "iphone.jpg",
            ),
            ProductBox(
              name: "Laptop",
              description: "Laptop is most productive tool",
              price: 2000,
              image: "laptop.jpg",
            ),
            ProductBox(
              name: "Tablet",
              description: "Tablet is the most useful device",
              price: 1500,
              image: "tablet.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  final String name, description, image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          // سيظهر أيقونة افتراضية إذا لم تجد الصورة
          Image.asset(
            "assets/images/$image",
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.smartphone, size: 100),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(description),
                  Text("Price: \$ $price"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
