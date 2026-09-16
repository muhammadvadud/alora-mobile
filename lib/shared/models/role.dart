import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('employee')
  employee,
  @JsonValue('manager')
  manager,
  @JsonValue('admin')
  admin,
  @JsonValue('unknown')
  unknown,
}

extension RoleX on Role {
  int get priority {
    switch (this) {
      case Role.employee:
        return 1;
      case Role.manager:
        return 2;
      case Role.admin:
        return 3;
      case Role.unknown:
        return 0;
    }
  }

  bool hasAccess(Role minRole) {
    return priority >= minRole.priority;
  }
}
