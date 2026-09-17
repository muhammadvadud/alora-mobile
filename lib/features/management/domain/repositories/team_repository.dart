import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../../domain/entities/employee.dart';
import '../../domain/entities/transcript_message.dart';
import '../../domain/entities/usage_limit.dart';

/// Jamoa (xodimlar) uchun repository interfeysi.
abstract class TeamRepository {
  /// Xodimlar ro'yxati.
  Future<List<Employee>> employees();

  /// Bitta xodim tafsiloti.
  Future<Employee> employee(String id);

  /// Yangi xodim qo'shish. 400 da `Failure.validation` qaytadi.
  Future<Employee> createEmployee({
    required String phone,
    required String fullName,
    required String password,
    required Role role,
    required bool isActive,
  });

  /// Xodimni yangilash. `patch` maydonlari: full_name, role, is_active, password...
  Future<Employee> updateEmployee({required String id, required Map<String, dynamic> patch});

  /// Xodim foydalanish limitini o'rnatish.
  Future<UsageLimit> setEmployeeLimit({
    required String id,
    required Map<String, dynamic> body,
  });

  /// Xodim suhbatlari ro'yxati.
  Future<List<Conversation>> employeeConversations(String employeeId);

  /// Suhbat transkripti (o'qish rejimi).
  Future<List<TranscriptMessage>> transcript(String conversationId);
}