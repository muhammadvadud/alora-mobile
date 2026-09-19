import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_daily_point.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

class ManagementSpendChart extends StatelessWidget {
  final List<UsageDailyPoint> daily;

  const ManagementSpendChart({super.key, required this.daily});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.management_chartTitle),
        const SizedBox(height: AppSpacing.m),
        AppCard(
          child: daily.length < 2
              ? _ChartEmpty(message: l10n.management_chartEmpty)
              : SizedBox(height: 160, child: _LineChart(daily: daily)),
        ),
      ],
    );
  }
}

class _ChartEmpty extends StatelessWidget {
  final String message;

  const _ChartEmpty({required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    return SizedBox(
      height: 160,
      child: Center(
        child: Text(
          message,
          style: typography.bodyM.copyWith(color: colors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  final List<UsageDailyPoint> daily;

  const _LineChart({required this.daily});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spots = [
      for (var i = 0; i < daily.length; i++) FlSpot(i.toDouble(), daily[i].costUzs.toDouble()),
    ];

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: _maxCost(daily) * 1.15,
        lineBarsData: [_buildLineBarsData(colors, spots)],
        titlesData: _buildTitlesData(context, colors),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(color: colors.border, strokeWidth: 1),
        ),
        lineTouchData: const LineTouchData(enabled: false),
      ),
      duration: Duration.zero,
    );
  }

  LineChartBarData _buildLineBarsData(AppColors colors, List<FlSpot> spots) {
    return LineChartBarData(
      spots: spots,
      isCurved: false,
      color: colors.accent,
      barWidth: 2,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) {
          if (index != daily.length - 1) {
            return FlDotCirclePainter(radius: 0);
          }
          return FlDotCirclePainter(
            radius: 4,
            color: colors.accent,
            strokeWidth: 2,
            strokeColor: colors.surface,
          );
        },
      ),
      belowBarData: BarAreaData(show: true, color: colors.accent.withValues(alpha: 0.08)),
    );
  }

  FlTitlesData _buildTitlesData(BuildContext context, AppColors colors) {
    final showEveryLabel = daily.length > 8 ? (daily.length / 6).ceil() : 1;

    return FlTitlesData(
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: showEveryLabel.toDouble(),
          reservedSize: 26,
          getTitlesWidget: (value, meta) {
            final index = value.round();
            if (index < 0 || index >= daily.length) {
              return const SizedBox.shrink();
            }
            final day = daily[index].date.day;
            return Text('$day', style: context.text.labelS.copyWith(color: colors.textSecondary));
          },
        ),
      ),
    );
  }

  int _maxCost(List<UsageDailyPoint> points) {
    var max = 1;
    for (final point in points) {
      if (point.costUzs > max) max = point.costUzs;
    }
    return max;
  }
}
