import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Store',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String? selectedBrand = 'Apple'; // الماركة المختارة افتراضياً

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر عبد الله للجوالات"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // القائمة المنسدلة لاختيار الماركة
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedBrand,
              isExpanded: true,
              items: <String>['Apple', 'Samsung', 'Google'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedBrand = newValue;
                });
              },
            ),
          ),

          // عرض المنتجات
          Expanded(
            child: ListView(
              children: [
                ProductBox(
                  name: "iPhone 15",
                  brand: "Apple",
                  description: "أحدث جوال من شركة أبل بلون الابيض مميز",
                  price: 4500,
                  image: "assets/p1.jpg", // المسار اللي ضبطناه سوا
                ),
                ProductBox(
                  name: "Pixel 8",
                  brand: "Google",
                  description: "جوال جوجل المميز بأفضل كاميرا ذكاء اصطناعي",
                  price: 3200,
                  image: "assets/p2.jpg", // المسار الثاني
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name, brand, description, image;
  final int price;

  const ProductBox({
    super.key,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(image, width: 100, height: 100, fit: BoxFit.contain),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "الماركة: $brand",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(description),
                  Text(
                    "السعر: $price ريال",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
