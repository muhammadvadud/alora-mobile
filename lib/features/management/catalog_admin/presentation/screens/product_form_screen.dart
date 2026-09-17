import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/notifiers/product_form_notifier.dart';

class ProductFormScreen extends ConsumerWidget {
  final String? productId;
  const ProductFormScreen({super.key, this.productId});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productFormProvider);
    final notifier = ref.read(productFormProvider.notifier);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Product Form')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              initialValue: state['name'] as String?,
              onChanged: (val) => notifier.updateField('name', val),
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            ElevatedButton(
              onPressed: () => notifier.save(),
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}