import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class TypingLine extends StatefulWidget {
  const TypingLine({super.key});

  @override
  State<TypingLine> createState() => _TypingLineState();
}

class _TypingLineState extends State<TypingLine> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))
      ..repeat();

    _animation = Tween<double>(
      begin: -40,
      end: 120,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 120,
      height: 2,
      decoration: BoxDecoration(color: colors.border, borderRadius: AppRadius.lineBorder),
      clipBehavior: Clip.hardEdge,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                left: _animation.value,
                top: 0,
                bottom: 0,
                width: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.accent,
                    borderRadius: AppRadius.lineBorder,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
