import 'package:flutter/material.dart';
import 'package:simple_product_lister/widget/productList.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการสินค้า", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: ProductList(),
    );
  }
}
