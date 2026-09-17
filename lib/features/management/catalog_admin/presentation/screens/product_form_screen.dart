import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

import '../../application/notifiers/product_form_notifier.dart';

class ProductFormScreen extends ConsumerWidget {
  final String? productId;
  const ProductFormScreen({super.key, this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productFormProvider);
    final notifier = ref.read(productFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.management_productFormTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              initialValue: state['name'] as String?,
              onChanged: (val) => notifier.updateField('name', val),
              decoration: InputDecoration(
                labelText: context.l10n.management_productName,
              ),
            ),
            ElevatedButton(
              onPressed: () => notifier.save(),
              child: Text(context.l10n.common_save),
            ),
          ],
        ),
      ),
    );
  }
}
