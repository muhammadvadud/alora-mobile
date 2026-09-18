import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_mode.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_status.dart';
import 'package:alora_mobile/features/management/application/employee_conversations_notifier.dart';
import 'package:alora_mobile/features/management/application/transcript_notifier.dart';
import 'package:alora_mobile/features/management/application/providers.dart';

import '../../../helpers/fake_team_repository.dart';

void main() {
  late ProviderContainer container;
  late FakeTeamRepository teamRepository;

  setUp(() {
    teamRepository = FakeTeamRepository();
    container = ProviderContainer(
      overrides: [teamRepositoryProvider.overrideWithValue(teamRepository)],
    );
    addTearDown(container.dispose);
  });

  test('employeeConversations: xodim suhbatlari yuklanadi', () async {
    teamRepository.conversationsResult = [
      const Conversation(
        id: 'conv-1',
        title: 'Suhbat 1',
        stage: ConversationStage.need,
        mode: ConversationMode.seller,
        status: ConversationStatus.active,
      ),
    ];

    final items = await container.read(
      employeeConversationsProvider('employee-1').future,
    );

    expect(teamRepository.conversationEmployeeIds, ['employee-1']);
    expect(items.single.id, 'conv-1');
  });

  test('employeeConversations xatosi error holatiga o\'tadi', () async {
    teamRepository.conversationsFailure = const Failure.network();

    final sub = container.listen(
      employeeConversationsProvider('employee-1'),
      (_, _) {},
    );
    await pumpEventQueue();

    expect(sub.read().hasError, isTrue);
    expect(sub.read().error, isA<Failure>());
    sub.close();
  });

  test('transcript: o\'qish rejimidagi xabarlar yuklanadi', () async {
    teamRepository.transcriptResult = [
      testTranscriptMessage(role: 'user', content: 'Salom!'),
      testTranscriptMessage(
        role: 'assistant',
        content: 'Assalomu alaykum!',
        toolCalls: [
          {'name': 'catalog_search', 'arguments': '{}'},
          {'name': 'calc_price', 'arguments': '{}'},
        ],
      ),
    ];

    final messages = await container.read(transcriptProvider('conv-1').future);

    expect(teamRepository.transcriptIds, ['conv-1']);
    expect(messages.length, 2);
    expect(messages.last.isAssistant, isTrue);
    expect(messages.last.toolNames, ['catalog_search', 'calc_price']);
  });

  test('transcript xatosi error holatiga o\'tadi', () async {
    teamRepository.transcriptFailure = const Failure.server();

    final sub = container.listen(transcriptProvider('conv-1'), (_, _) {});
    await pumpEventQueue();

    expect(sub.read().hasError, isTrue);
    expect(sub.read().error, isA<Failure>());
    sub.close();
  });
}
