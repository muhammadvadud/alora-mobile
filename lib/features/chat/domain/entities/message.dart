import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';
import 'pricing_option.dart';
import 'order_draft.dart';
import 'product_ref.dart';

part 'message.freezed.dart';

enum MessageRole { user, assistant, system, unknown }

enum MessageStatus { sending, streaming, done, error, unknown }

enum ToolChipState { running, done, error, unknown }

@freezed
sealed class RichBlock with _$RichBlock {
  const factory RichBlock.toolChip({
    required String tool,
    required ToolChipState state,
    String? resultText,
    String? rawArgs,
    String? rawResult,
  }) = _ToolChip;

  const factory RichBlock.products({required List<ProductRef> products}) = _Products;

  const factory RichBlock.quote({required Quote quote}) = _QuoteBlock;

  const factory RichBlock.options({required PricingOptions options}) = _Options;

  const factory RichBlock.orderDraft({required OrderDraft draft}) = _OrderDraftBlock;

  const factory RichBlock.warning({required String message}) = _Warning;
}

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required MessageRole role,
    required String content,
    required DateTime createdAt,
    required MessageStatus status,
    @Default([]) List<RichBlock> richBlocks,
  }) = _Message;
}
