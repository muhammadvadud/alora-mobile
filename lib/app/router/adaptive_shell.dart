import 'package:flutter/material.dart';

/// Planshet/keng ekranlar uchun adaptiv joylashuv.
/// Kenglik >= [splitWidth] bo'lsa va [leading] berilgan bo'lsa
/// ikki panel (chap qatlam + kontent), aks holda bitta panel.
class AdaptiveShell extends StatelessWidget {
  final Widget? leading;
  final Widget child;

  const AdaptiveShell({super.key, this.leading, required this.child});

  static const double splitWidth = 840;
  static const double paneWidth = 320;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final split = leading != null && constraints.maxWidth >= splitWidth;
        if (!split) {
          return TabletCentered(child: child);
        }
        return Row(
          children: [
            SizedBox(width: paneWidth, child: leading),
            Expanded(child: TabletCentered(child: child)),
          ],
        );
      },
    );
  }
}

/// Keng ekranda kontentni markazga joylab, [maxContentWidth] bilan cheklaydi.
class TabletCentered extends StatelessWidget {
  final Widget child;

  const TabletCentered({super.key, required this.child});

  static const double maxContentWidth = 720;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxContentWidth),
        child: child,
      ),
    );
  }
}
