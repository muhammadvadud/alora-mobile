import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// "Ilova haqida" (20.9): versiya, build raqami, muhit.
/// Versiya/build `PackageInfo` dan (pubspec `version` — har qanday build usulida to'g'ri);
/// `--dart-define` bo'lsa u ustun, aks holda `Env` default (`0.0.0`) ko'rinmaydi.
class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  String _version = Env.appVersion;
  String _build = Env.buildNumber;

  @override
  void initState() {
    super.initState();
    if (Env.appVersion == '0.0.0') _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!mounted) return;
      setState(() {
        _version = info.version;
        _build = info.buildNumber;
      });
    } catch (_) {
      // Platform kanali yo'q (test/web) — Env qiymati qoladi.
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(AppIcons.info, size: 20, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.s),
            SectionLabel(l10n.profile_aboutTitle),
          ],
        ),
        _AboutRow(label: l10n.profile_aboutVersion, value: _version),
        const SizedBox(height: AppSpacing.s),
        _AboutRow(label: l10n.profile_aboutBuild, value: _build),
        const SizedBox(height: AppSpacing.s),
        _AboutRow(label: l10n.profile_aboutEnv, value: Env.env),
      ],
    );
  }
}

class _AboutRow extends StatelessWidget {
  const _AboutRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: typography.bodyS.copyWith(color: colors.textSecondary)),
        Text(
          value,
          style: typography.bodyS.copyWith(
            color: colors.textPrimary,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
