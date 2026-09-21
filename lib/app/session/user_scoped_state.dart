import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/application/product_detail_notifier.dart';
import 'package:alora_mobile/features/chat/application/chat_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/management/application/management_period_notifier.dart';

/// Foydalanuvchi sessiya tugaganida yoki akkaunt almashganda eski
/// foydalanuvchining in-memory holatini (Riverpod keshlarini) tozalaydi.
///
/// Faqat `keepAlive` foydalanuvchi "scoped" providerlar shu yerda
/// invalidatsiya qilinadi: autoDispose providerlar logout'da ekranlar
/// unmount bo'lgach o'zi yo'qoladi va yangi sessiyada qayta quriladi.
/// invalidate qilingan provider navbatdagi o'qishda qayta quriladi,
/// shuning uchun yangi foydalanuvchi o'z ma'lumotini yangidan yuklaydi.
void resetUserScopedState(Ref ref) {
  ref.invalidate(conversationsProvider);
  ref.invalidate(chatProvider);
  ref.invalidate(catalogProvider);
  ref.invalidate(productDetailProvider);
  ref.invalidate(managementPeriodProvider);
}