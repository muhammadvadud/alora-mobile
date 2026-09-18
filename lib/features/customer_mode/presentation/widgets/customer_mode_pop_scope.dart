import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';

class CustomerModePopScope extends ConsumerWidget {
  final Widget child;

  const CustomerModePopScope({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerMode = ref.watch(customerModeEnabledProvider);
    return PopScope(canPop: !customerMode, child: child);
  }
}
