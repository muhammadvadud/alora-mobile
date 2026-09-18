import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';

import '../domain/entities/conversion_stats.dart';
import '../domain/entities/management_home_data.dart';
import '../domain/entities/usage_summary.dart';
import '../domain/entities/user_usage.dart';
import 'management_period_notifier.dart';
import 'providers.dart';

part 'management_home_notifier.g.dart';

/// Boshqaruv bosh sahifasi (S-19) ma'lumotlarini parallel yuklaydi.
/// Davr o'zgarsa [managementPeriodProvider] orqali qayta yuklanadi.
@riverpod
class ManagementHomeNotifier extends _$ManagementHomeNotifier {
  @override
  Future<ManagementHomeData> build() async {
    final period = ref.watch(managementPeriodProvider);
    final usageRepository = ref.watch(usageRepositoryProvider);

    try {
      final (
        UsageSummary usage,
        ConversionStats conversion,
        List<UserUsage> ranking,
      ) = await (
        usageRepository.summary(period: period),
        usageRepository.conversion(),
        usageRepository.byUser(period: period),
      ).wait;

      return ManagementHomeData(
        usage: usage,
        conversion: conversion,
        ranking: ranking,
      );
    } on Failure {
      rethrow;
    } catch (error) {
      throw Failure.unknown(error.toString());
    }
  }
}
