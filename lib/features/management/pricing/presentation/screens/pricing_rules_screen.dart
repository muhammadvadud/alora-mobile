import 'package:flutter/material.dart';

class PricingRulesScreen extends StatelessWidget {
  const PricingRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pricing Rules')),
      body: ListView(
        children: [
          const Text('Coefficients inline edit'),
          const Text('Discount tiers table'),
          const Text('Default values'),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const Text('Hisobni sinash'),
              );
            },
            child: const Text('Hisobni sinash'),
          ),
        ],
      ),
    );
  }
}
