import 'package:alora_mobile/shared/models/role.dart';

import '../../domain/entities/limit_status.dart';
import '../../domain/entities/user.dart';
import '../dto/auth_me_dto.dart';
import '../dto/limit_dto.dart';

/// AuthMeDto'ni domain modelga o'tkazadi
extension AuthMeDtoMapper on AuthMeDto {
  User toUser() {
    final profile = this.profile;
    return User(
      id: profile.id,
      phone: profile.phone,
      fullName: profile.fullName,
      role: roleFromName(profile.role),
      tenant: profile.tenant,
      deviceId: profile.deviceId,
      managerPhone: profile.managerPhone,
    );
  }

  LimitStatus? toLimitStatus() {
    final limitDto = limit;
    if (limitDto == null) return null;
    return limitDto.toLimitStatus();
  }
}

/// Backend role'ni [Role] enum'ga o'tkazadi; noma'lum qiymat [Role.unknown]'ga tushadi.
Role roleFromName(String value) {
  for (final role in Role.values) {
    if (role.name == value) return role;
  }
  return Role.unknown;
}

extension LimitDtoMapper on LimitDto {
  LimitStatus toLimitStatus() {
    return LimitStatus(
      id: id,
      userId: userId,
      period: period,
      isUnlimited: isUnlimited,
      maxTokens: maxTokens,
      maxCostUzs: maxCostUzs,
      maxMessages: maxMessages,
      onExceed: onExceed,
      isActive: isActive,
    );
  }
}
