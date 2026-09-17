import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

class ProductsManageScreen extends StatelessWidget {
  const ProductsManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.management_productsTitle)),
      body: Center(child: Text(context.l10n.management_productsList)),
    );
  }
}
