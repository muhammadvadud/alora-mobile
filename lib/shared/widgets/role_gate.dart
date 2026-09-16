import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/models/role.dart';

class RoleGate extends StatelessWidget {
  final Role minRole;
  final Role currentRole;
  final Widget child;
  final Widget replacement;

  const RoleGate({
    super.key,
    required this.minRole,
    required this.currentRole,
    required this.child,
    this.replacement = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    if (currentRole.hasAccess(minRole)) {
      return child;
    }
    return replacement;
  }
}
