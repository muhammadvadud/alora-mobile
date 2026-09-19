import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/customer_mode/application/pin_result.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class SetPinDialog extends ConsumerStatefulWidget {
  const SetPinDialog({super.key});

  @override
  ConsumerState<SetPinDialog> createState() => _SetPinDialogState();
}

class _SetPinDialogState extends ConsumerState<SetPinDialog> {
  String _pin = '';
  String? _confirmPin;
  String? _error;

  void _onDigit(String digit) {
    setState(() {
      _error = null;
      if (_pin.length < 4) {
        _pin += digit;
      }
    });

    if (_pin.length == 4) {
      if (_confirmPin == null) {
        setState(() {
          _confirmPin = _pin;
          _pin = '';
        });
      } else {
        if (_confirmPin == _pin) {
          ref.read(customerModeNotifierProvider.notifier).enable(_pin).then((_) {
            if (mounted) Navigator.of(context).pop();
          });
        } else {
          setState(() {
            _error = context.l10n.chat_pinMismatch;
            _pin = '';
            _confirmPin = null;
          });
        }
      }
    }
  }

  void _onDelete() {
    setState(() {
      _error = null;
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _confirmPin == null
                    ? context.l10n.chat_setPinTitle
                    : context.l10n.chat_confirmPinTitle,
                style: context.text.titleL,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.l),
              _PinDots(pinLength: _pin.length),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.l),
                Text(
                  _error!,
                  style: context.text.bodyM.copyWith(color: colors.danger),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              _Numpad(isLocked: false, onDigit: _onDigit, onDelete: _onDelete),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterPinDialog extends ConsumerStatefulWidget {
  const EnterPinDialog({super.key});

  @override
  ConsumerState<EnterPinDialog> createState() => _EnterPinDialogState();
}

class _EnterPinDialogState extends ConsumerState<EnterPinDialog> {
  String _pin = '';
  String? _error;
  bool _isLoading = false;

  Future<void> _onDigit(String digit) async {
    if (_isLoading) return;

    setState(() {
      _error = null;
      if (_pin.length < 4) {
        _pin += digit;
      }
    });

    if (_pin.length == 4) {
      setState(() {
        _isLoading = true;
      });

      final result = await ref.read(customerModeNotifierProvider.notifier).disable(_pin);
      if (!mounted) return;

      switch (result) {
        case PinOk():
          Navigator.of(context).pop();
        case PinWrong(attemptsLeft: final attemptsLeft):
          setState(() {
            _error = context.l10n.pin_attemptsLeft(attemptsLeft);
            _pin = '';
            _isLoading = false;
          });
        case PinLocked(seconds: final seconds):
          setState(() {
            _error = context.l10n.chat_pinAttemptsWait(seconds);
            _pin = '';
            _isLoading = false;
          });
      }
    }
  }

  void _onDelete() {
    setState(() {
      _error = null;
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final notifier = ref.watch(customerModeNotifierProvider.notifier);
    final lockUntil = notifier.lockUntil;
    final isLocked = lockUntil != null && DateTime.now().isBefore(lockUntil);
    if (isLocked && _error == null) {
      _error = context.l10n.chat_pinAttemptsWait(lockUntil.difference(DateTime.now()).inSeconds);
    }

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.l10n.chat_enterPinTitle, style: context.text.titleL),
              const SizedBox(height: AppSpacing.l),
              _PinDots(pinLength: _pin.length),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.l),
                Text(
                  _error!,
                  style: context.text.bodyM.copyWith(color: colors.danger),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              _Numpad(isLocked: isLocked, onDigit: _onDigit, onDelete: _onDelete),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinDots extends StatelessWidget {
  final int pinLength;

  const _PinDots({required this.pinLength});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < pinLength;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
          width: AppSpacing.l,
          height: AppSpacing.l,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? colors.accent : colors.surfaceMuted,
          ),
        );
      }),
    );
  }
}

class _Numpad extends StatelessWidget {
  final bool isLocked;
  final ValueChanged<String> onDigit;
  final VoidCallback onDelete;

  const _Numpad({required this.isLocked, required this.onDigit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      mainAxisSpacing: AppSpacing.s,
      crossAxisSpacing: AppSpacing.s,
      children: [
        for (var i = 1; i <= 9; i++)
          _NumpadButton(text: i.toString(), onTap: isLocked ? null : () => onDigit(i.toString())),
        const SizedBox(),
        _NumpadButton(text: '0', onTap: isLocked ? null : () => onDigit('0')),
        _NumpadButton(text: '<-', onTap: isLocked ? null : onDelete),
      ],
    );
  }
}

class _NumpadButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const _NumpadButton({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.input)),
      child: Center(
        child: Text(
          text,
          style: context.text.titleL.copyWith(
            color: onTap == null ? context.colors.textDisabled : context.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
