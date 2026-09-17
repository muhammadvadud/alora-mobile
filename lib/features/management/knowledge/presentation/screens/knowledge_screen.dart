import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.management_knowledgeTitle)),
      body: Center(child: Text(context.l10n.management_knowledgeList)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
