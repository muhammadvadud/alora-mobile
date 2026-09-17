import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

class PricingRulesScreen extends StatelessWidget {
  const PricingRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.management_pricingTitle)),
      body: ListView(
        children: [
          Text(context.l10n.management_pricingCoefficients),
          Text(context.l10n.management_pricingTiers),
          Text(context.l10n.management_pricingDefaults),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Text(context.l10n.management_pricingTest),
              );
            },
            child: Text(context.l10n.management_pricingTest),
          ),
        ],
      ),
    );
  }
}
