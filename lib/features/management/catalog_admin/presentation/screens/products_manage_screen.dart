
import 'package:flutter/material.dart';

class ProductsManageScreen extends StatelessWidget {
  const ProductsManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Products')),
      body: const Center(child: Text('List')),
    );
  }
}
