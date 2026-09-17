import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';

import 'providers.dart';

part 'employee_conversations_notifier.g.dart';

/// Bitta xodimning suhbatlari ro'yxati.
@riverpod
class EmployeeConversationsNotifier extends _$EmployeeConversationsNotifier {
  @override
  Future<List<Conversation>> build(String employeeId) async {
    final repository = ref.watch(teamRepositoryProvider);
    return repository.employeeConversations(employeeId);
  }
}
