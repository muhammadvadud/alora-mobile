import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

void main() {
  test('ApiPaths barcha qiymatlar / bilan tugashi, / bilan boshlanmasligi kerak', () {
    final paths = [
      ApiPaths.login,
      ApiPaths.refresh,
      ApiPaths.logout,
      ApiPaths.me,
      ApiPaths.conversations,
      ApiPaths.conversation('1'),
      ApiPaths.conversationReset('1'),
      ApiPaths.conversationTranscript('1'),
      ApiPaths.conversationMessages('1'),
      ApiPaths.voiceSocket('1'),
      ApiPaths.categories,
      ApiPaths.products,
      ApiPaths.product('1'),
      ApiPaths.variant('1'),
      ApiPaths.variantsBulkPrice,
      ApiPaths.productImages('1'),
      ApiPaths.catalogImage('1'),
      ApiPaths.fasons,
      ApiPaths.orders,
      ApiPaths.order('1'),
      ApiPaths.orderConfirm('1'),
      ApiPaths.orderStatus('1'),
      ApiPaths.orderStatuses,
      ApiPaths.orderPdf('1'),
      ApiPaths.calcPreview,
      ApiPaths.calcRules,
      ApiPaths.calcRule('1'),
      ApiPaths.services,
      ApiPaths.discountTiers,
      ApiPaths.discountPolicy,
      ApiPaths.orderDefaults,
      ApiPaths.modelPricings,
      ApiPaths.knowledgeRules,
      ApiPaths.employees,
      ApiPaths.employee('1'),
      ApiPaths.employeeLimit('1'),
      ApiPaths.employeeConversations('1'),
      ApiPaths.usageSummary,
      ApiPaths.usageByUser,
      ApiPaths.usageConversations,
      ApiPaths.analyticsConversion,
      ApiPaths.settingsPrompt,
      ApiPaths.settingsPromptRollback('1'),
    ];

    for (final path in paths) {
      expect(path.startsWith('/'), isFalse, reason: 'Path $path / bilan boshlanmasligi kerak');
      expect(path.endsWith('/'), isTrue, reason: 'Path $path / bilan tugashi kerak');
    }
  });
}
