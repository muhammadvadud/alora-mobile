import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

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
          ref.read(customerModeNotifierProvider.notifier).enable(_pin).then((
            _,
          ) {
            if (mounted) Navigator.of(context).pop();
          });
        } else {
          setState(() {
            _error = 'PIN kodlar mos tushmadi';
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
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _confirmPin == null
                    ? 'PIN kodni o\'rnating'
                    : 'PIN kodni tasdiqlang',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isFilled = index < _pin.length;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled
                          ? Theme.of(context).colorScheme.primary
                          : context.colors.surfaceMuted,
                    ),
                  );
                }),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
              const SizedBox(height: 24),
              _buildNumpad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumpad() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        for (var i = 1; i <= 9; i++)
          _buildButton(i.toString(), () => _onDigit(i.toString())),
        const SizedBox(),
        _buildButton('0', () => _onDigit('0')),
        _buildButton('<-', _onDelete),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.input)),
      child: Center(child: Text(text, style: context.text.displayM)),
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

      try {
        final success = await ref
            .read(customerModeNotifierProvider.notifier)
            .disable(_pin);
        if (!mounted) return;

        if (success) {
          Navigator.of(context).pop();
        } else {
          setState(() {
            _error = 'Noto\'g\'ri PIN kod';
            _pin = '';
            _isLoading = false;
          });
        }
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _error = e.toString().replaceAll('Exception: ', '');
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
    final notifier = ref.watch(customerModeNotifierProvider.notifier);
    final isLocked =
        notifier.lockUntil != null &&
        DateTime.now().isBefore(notifier.lockUntil!);
    if (isLocked && _error == null) {
      final seconds = notifier.lockUntil!.difference(DateTime.now()).inSeconds;
      _error = '3 marta xato. $seconds soniya kuting.';
    }

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PIN kodni kiriting',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isFilled = index < _pin.length;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled
                          ? Theme.of(context).colorScheme.primary
                          : context.colors.surfaceMuted,
                    ),
                  );
                }),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),
              _buildNumpad(isLocked),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumpad(bool isLocked) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        for (var i = 1; i <= 9; i++)
          _buildButton(
            i.toString(),
            isLocked ? null : () => _onDigit(i.toString()),
          ),
        const SizedBox(),
        _buildButton('0', isLocked ? null : () => _onDigit('0')),
        _buildButton('<-', isLocked ? null : _onDelete),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.input)),
      child: Center(
        child: Text(
          text,
          style: context.text.titleL.copyWith(
            color: onTap == null
                ? context.colors.textDisabled
                : context.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
