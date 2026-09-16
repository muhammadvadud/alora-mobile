import 'dart:convert';

import 'package:alora_mobile/features/chat/data/dto/chat_dto.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/features/chat/domain/entities/product_ref.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';

class ChatMapper {
  static Message fromDto(MessageDto dto) {
    MessageRole role = MessageRole.unknown;
    switch (dto.role) {
      case 'user':
        role = MessageRole.user;
        break;
      case 'assistant':
        role = MessageRole.assistant;
        break;
      case 'tool':
        role = MessageRole.system;
        break;
      case 'system':
        role = MessageRole.system;
        break;
    }

    final List<RichBlock> blocks = [];

    // As in standard chat format, if we have tool calls
    if (dto.toolCalls != null && dto.toolCalls!.isNotEmpty) {
      for (final call in dto.toolCalls!) {
        final function = call['function'] as Map<String, dynamic>?;
        if (function != null) {
          blocks.add(
            RichBlock.toolChip(
              tool: function['name'] as String? ?? 'Noma\'lum',
              state: ToolChipState.done,
              rawArgs: function['arguments'] as String?,
            ),
          );
        }
      }
    }

    if (dto.toolResult != null) {
      final name = dto.toolResult!['name'] as String?;
      final contentRaw = dto.toolResult!['content'];
      String contentStr = '';
      if (contentRaw is String) {
        contentStr = contentRaw;
      } else if (contentRaw != null) {
        contentStr = jsonEncode(contentRaw);
      }

      if (name != null) {
        final parsedBlock = parseToolResult(name, contentStr);
        blocks.add(parsedBlock);
      }
    }

    return Message(
      id: dto.id,
      role: role,
      content: dto.content,
      createdAt: dto.createdAt,
      status: MessageStatus.done,
      richBlocks: blocks,
    );
  }

  static RichBlock parseToolResult(String tool, String resultStr) {
    try {
      final data = jsonDecode(resultStr);

      switch (tool) {
        case 'product_search':
          if (data is Map<String, dynamic> && data['products'] is List) {
            final products = (data['products'] as List).map((e) {
              final p = e as Map<String, dynamic>;
              return ProductRef(
                id: p['id']?.toString() ?? '',
                name: p['name']?.toString() ?? '',
                category: p['category']?.toString() ?? '',
                price:
                    num.tryParse(p['price']?.toString() ?? '0')?.toInt() ?? 0,
                priceUnit: p['price_unit']?.toString() ?? '',
                imageUrl: p['image_url']?.toString() ?? '',
                colorHex: p['color_hex']?.toString() ?? '',
                colorName: p['color_name']?.toString() ?? '',
              );
            }).toList();
            return RichBlock.products(products: products);
          }
          break;
        case 'curtain_calculate':
        case 'price_quote':
          if (data is Map<String, dynamic>) {
            // Let's see if it's an OptionsCard or a QuoteCard
            if (data.containsKey('options')) {
              // Parse OptionsCard
              final options = (data['options'] as List).map((e) {
                final o = e as Map<String, dynamic>;
                PricingTier tier = PricingTier.unknown;
                switch (o['tier']) {
                  case 'cheap':
                    tier = PricingTier.cheap;
                    break;
                  case 'mid':
                    tier = PricingTier.mid;
                    break;
                  case 'premium':
                    tier = PricingTier.premium;
                    break;
                }
                final lines = (o['lines'] as List).map((l) {
                  final line = l as Map<String, dynamic>;
                  return PricingOptionLine(
                    title: line['title']?.toString() ?? '',
                    value: line['value']?.toString() ?? '',
                  );
                }).toList();
                return PricingOption(
                  tier: tier,
                  title: o['title']?.toString() ?? '',
                  total:
                      num.tryParse(o['total']?.toString() ?? '0')?.toInt() ?? 0,
                  lines: lines,
                  difference: o['difference'] != null
                      ? num.tryParse(o['difference'].toString())?.toInt()
                      : null,
                );
              }).toList();
              return RichBlock.options(
                options: PricingOptions(options: options),
              );
            } else {
              // Parse QuoteCard
              return RichBlock.quote(quote: parseQuote(data));
            }
          }
          break;
        case 'order_draft':
          if (data is Map<String, dynamic>) {
            final ms =
                (data['measurements'] as List?)?.map((e) {
                  final m = e as Map<String, dynamic>;
                  return OrderDraftMeasurement(
                    roomName: m['room_name']?.toString(),
                    cornice: m['cornice'] != null
                        ? num.tryParse(m['cornice'].toString())?.toDouble()
                        : null,
                    height: m['height'] != null
                        ? num.tryParse(m['height'].toString())?.toDouble()
                        : null,
                  );
                }).toList() ??
                [];
            return RichBlock.orderDraft(
              draft: OrderDraft(
                customerName: data['customer_name']?.toString(),
                phone: data['phone']?.toString(),
                address: data['address']?.toString(),
                measurements: ms,
                total:
                    num.tryParse(data['total']?.toString() ?? '0')?.toInt() ??
                    0,
                prepayment: data['prepayment'] != null
                    ? num.tryParse(data['prepayment'].toString())?.toInt()
                    : null,
                deadline: data['deadline'] != null
                    ? DateTime.tryParse(data['deadline'].toString())
                    : null,
                missingFields:
                    (data['missing_fields'] as List?)
                        ?.map((e) => e.toString())
                        .toList() ??
                    [],
              ),
            );
          }
          break;
        case 'variants':
          if (data is Map<String, dynamic> && data.containsKey('options')) {
            final options = (data['options'] as List).map((e) {
              final o = e as Map<String, dynamic>;
              PricingTier tier = PricingTier.unknown;
              switch (o['tier']) {
                case 'cheap':
                  tier = PricingTier.cheap;
                  break;
                case 'mid':
                  tier = PricingTier.mid;
                  break;
                case 'premium':
                  tier = PricingTier.premium;
                  break;
              }
              final lines = (o['lines'] as List).map((l) {
                final line = l as Map<String, dynamic>;
                return PricingOptionLine(
                  title: line['title']?.toString() ?? '',
                  value: line['value']?.toString() ?? '',
                );
              }).toList();
              return PricingOption(
                tier: tier,
                title: o['title']?.toString() ?? '',
                total:
                    num.tryParse(o['total']?.toString() ?? '0')?.toInt() ?? 0,
                lines: lines,
                difference: o['difference'] != null
                    ? num.tryParse(o['difference'].toString())?.toInt()
                    : null,
              );
            }).toList();
            return RichBlock.options(options: PricingOptions(options: options));
          }
          break;
      }
    } catch (e, st) {
      logger.w('Tool result parse xatosi: $tool', error: e, stackTrace: st);
    }

    // Parse xatosi bo'lsa
    return RichBlock.toolChip(
      tool: tool,
      state: ToolChipState.done,
      rawResult: resultStr,
    );
  }

  static Quote parseQuote(Map<String, dynamic> data) {
    final fabrics = <QuoteFabric>[];
    final accessories = <QuoteAccessory>[];
    QuoteMeasurement? quoteMeasurement;

    if (data['measurements'] != null && data['measurements'] is List) {
      final measures = data['measurements'] as List;
      for (final mRaw in measures) {
        final m = mRaw as Map<String, dynamic>;
        final length =
            num.tryParse(m['length']?.toString() ?? '0')?.toDouble() ?? 0.0;
        final height =
            num.tryParse(m['height']?.toString() ?? '0')?.toDouble() ?? 0.0;

        // Take the first measurement's dimensions if quoteMeasurement is null
        if (quoteMeasurement == null && length > 0) {
          quoteMeasurement = QuoteMeasurement(
            cornice: length,
            height: height,
            coef: 0,
          );
        }

        if (m['parts'] != null && m['parts'] is List) {
          for (final pRaw in m['parts'] as List) {
            final p = pRaw as Map<String, dynamic>;
            fabrics.add(
              QuoteFabric(
                role: p['role']?.toString() ?? '',
                variantId: p['variant_id']?.toString() ?? '',
                colorName:
                    p['color_name']?.toString() ?? p['sku']?.toString() ?? '',
                colorHex: p['color_hex']?.toString() ?? '',
                widthM:
                    num.tryParse(p['width_m']?.toString() ?? '0')?.toDouble() ??
                    0.0,
                heightM:
                    num.tryParse(p['height_m']?.toString() ?? '0')
                        ?.toDouble() ??
                    0.0,
                coef:
                    num.tryParse(p['coef']?.toString() ?? '0')?.toDouble() ??
                    0.0,
                areaSqm:
                    num.tryParse(
                      p['area_m2']?.toString() ??
                          p['raw_area_m2']?.toString() ??
                          '0',
                    )?.toDouble() ??
                    0.0,
                pricePerSqm:
                    num.tryParse(p['unit_price']?.toString() ?? '0')?.toInt() ??
                    0,
                total:
                    num.tryParse(p['line_total']?.toString() ?? '0')?.toInt() ??
                    0,
              ),
            );

            // If quoteMeasurement has no coef yet, try to set one
            if (quoteMeasurement != null && quoteMeasurement.coef == 0.0) {
              final coef =
                  num.tryParse(p['coef']?.toString() ?? '0')?.toDouble() ?? 0.0;
              if (coef > 0) {
                quoteMeasurement = quoteMeasurement.copyWith(coef: coef);
              }
            }
          }
        }
        if (m['accessories'] != null && m['accessories'] is List) {
          for (final aRaw in m['accessories'] as List) {
            final a = aRaw as Map<String, dynamic>;
            accessories.add(
              QuoteAccessory(
                name: a['sku']?.toString() ?? '',
                qty:
                    num.tryParse(a['qty']?.toString() ?? '0')?.toDouble() ??
                    0.0,
                unit: 'dona',
                unitPrice:
                    num.tryParse(a['unit_price']?.toString() ?? '0')?.toInt() ??
                    0,
                total:
                    num.tryParse(a['line_total']?.toString() ?? '0')?.toInt() ??
                    0,
              ),
            );
          }
        }
      }
    }

    final services = <QuoteService>[];
    if (data['services'] != null && data['services'] is List) {
      for (final sRaw in data['services'] as List) {
        if (sRaw is Map<String, dynamic>) {
          services.add(
            QuoteService(
              name: sRaw['name']?.toString() ?? sRaw['key']?.toString() ?? '',
              qty: sRaw['qty'] != null
                  ? num.tryParse(sRaw['qty'].toString())?.toDouble()
                  : null,
              total:
                  num.tryParse(sRaw['line_total']?.toString() ?? '0')
                      ?.toInt() ??
                  0,
            ),
          );
        }
      }
    }

    final warnings = <String>[];
    if (data['warnings'] != null && data['warnings'] is List) {
      for (final w in data['warnings'] as List) {
        warnings.add(w.toString());
      }
    }

    return Quote(
      fabrics: fabrics,
      accessories: accessories,
      services: services,
      wasteWarnings: warnings,
      formula:
          data['formula']?.toString() ??
          'Hisob formulasi: (Eni * K) * Balandlik',
      subtotal: num.tryParse(data['subtotal']?.toString() ?? '0')?.toInt() ?? 0,
      discount:
          num.tryParse(data['discount_amount']?.toString() ?? '0')?.toInt() ??
          0,
      delivery:
          num.tryParse(data['delivery_amount']?.toString() ?? '0')?.toInt() ??
          0,
      total: num.tryParse(data['total']?.toString() ?? '0')?.toInt() ?? 0,
      measurement:
          quoteMeasurement ??
          const QuoteMeasurement(cornice: 0, height: 0, coef: 0),
    );
  }
}
