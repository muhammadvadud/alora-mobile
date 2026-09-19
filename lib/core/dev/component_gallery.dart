import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/tool_chip.dart';
import 'package:alora_mobile/shared/widgets/typing_line.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/letter_avatar.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';
import 'package:alora_mobile/shared/widgets/limit_progress_bar.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';
import 'package:alora_mobile/shared/widgets/waveform.dart';
import 'package:alora_mobile/shared/widgets/app_icon_button.dart';
import 'package:alora_mobile/shared/widgets/suggestion_chip.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/scroll_down_button.dart';

import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class ComponentGallery extends StatelessWidget {
  final bool showAnimations;

  const ComponentGallery({super.key, this.showAnimations = true});

  @override
  Widget build(BuildContext context) {
    if (!Env.isDev) return const SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(title: const Text('Component Gallery')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          _buildSection('AppButton', [
            AppButton(text: 'Primary Button', onPressed: () {}),
            if (showAnimations) ...[
              const SizedBox(height: 8),
              AppButton(text: 'Primary Loading', isLoading: true, onPressed: () {}),
            ],
            const SizedBox(height: 8),
            AppButton.secondary(text: 'Secondary Button', onPressed: () {}),
            const SizedBox(height: 8),
            AppButton.text(text: 'Text Button', onPressed: () {}),
            const SizedBox(height: 8),
            AppButton.destructive(text: 'Destructive', onPressed: () {}),
          ]),
          _buildSection('AppChip & AppCountChip', [
            Wrap(
              spacing: 8,
              children: [
                AppChip(label: 'Unselected', onTap: () {}),
                AppChip(label: 'Selected', state: AppChipState.selected, onTap: () {}),
                AppChip(label: 'Category', state: AppChipState.categorySelected, onTap: () {}),
                AppCountChip(label: 'Qoralama', count: 3, onTap: () {}),
              ],
            ),
          ]),
          _buildSection('ToolChip', [
            Wrap(
              spacing: 8,
              children: [
                if (showAnimations)
                  ToolChip(text: 'Qidirilmoqda', state: ToolChipState.running, onTap: () {}),
                ToolChip(text: 'Topildi', state: ToolChipState.done, onTap: () {}),
                ToolChip(text: 'Xato', state: ToolChipState.error, onTap: () {}),
              ],
            ),
          ]),
          if (showAnimations) _buildSection('TypingLine', [const TypingLine()]),
          _buildSection('StatusPill & PaymentChip', [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: OrderStatus.values.map((s) => StatusPill(status: s)).toList(),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: PaymentStatus.values.map((s) => PaymentChip(status: s)).toList(),
            ),
          ]),
          _buildSection('TextFields', [
            const AppTextField(hintText: 'Normal text field'),
            const SizedBox(height: 8),
            const AppTextField(hintText: 'Password', type: AppTextFieldType.password),
            const SizedBox(height: 8),
            const AppTextField(hintText: 'Search', type: AppTextFieldType.search),
            const SizedBox(height: 8),
            const AppTextField(hintText: 'Error state', errorText: 'Invalid input'),
            const SizedBox(height: 8),
            const PhoneField(),
          ]),
          _buildSection('Text Utilities', [
            const MoneyText(amount: 2748000),
            const SizedBox(height: 8),
            const UnitText(amount: 150000, unit: PriceUnit.perSqm),
            const SizedBox(height: 8),
            const ColorDot(colorHex: '0E5751'),
            const SizedBox(height: 8),
            const LetterAvatar(text: 'Aziza'),
            const SizedBox(height: 8),
            const SectionLabel('Matolar'),
          ]),
          _buildSection('AppCard', [
            const AppCard(child: Text('Normal Card')),
            const SizedBox(height: 8),
            const AppCard(isSelected: true, child: Text('Selected Card')),
          ]),
          _buildSection('Progress & Skeleton', [
            const LimitProgressBar(progress: 0.5),
            const SizedBox(height: 8),
            const LimitProgressBar(progress: 0.9),
            const SizedBox(height: 8),
            const LimitProgressBar(progress: 1.0),
            if (showAnimations) ...[
              const SizedBox(height: 16),
              const SkeletonBox(width: double.infinity, height: 60),
              const SizedBox(height: 8),
              const SkeletonList(
                itemCount: 2,
                itemBuilder: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: SkeletonBox(width: double.infinity, height: 40),
                ),
              ),
            ],
          ]),

          _buildSection('AppIconButton & AppRadio & SuggestionChip', [
            Row(
              children: [
                AppIconButton.muted(
                  icon: LucideIcons.mic,
                  onPressed: () {},
                  semanticLabel: 'Muted',
                ),
                const SizedBox(width: 16),
                AppIconButton.accent(
                  icon: LucideIcons.arrowUp,
                  onPressed: () {},
                  semanticLabel: 'Accent',
                ),
                const SizedBox(width: 16),
                AppRadio(isSelected: false, onTap: () {}),
                const SizedBox(width: 16),
                AppRadio(isSelected: true, onTap: () {}),
                const SizedBox(width: 16),
                ScrollDownButton(onPressed: () {}),
              ],
            ),
            const SizedBox(height: 16),
            SuggestionChip(title: 'Sample title', subtitle: 'Sample subtitle', onTap: () {}),
          ]),
          _buildSection('AppListTile', [
            AppListTile(title: 'List Title', subtitle: 'List subtitle', onTap: () {}),
            AppListTile(title: 'List Title No Subtitle', onTap: () {}),
          ]),

          _buildSection('States', [
            const OfflineBanner(),
            const SizedBox(height: 16),
            Container(
              height: 300,
              decoration: BoxDecoration(border: Border.all(color: context.colors.border)),
              child: EmptyState(
                icon: AppIcons.inbox,
                title: 'Hali buyurtma yo\'q',
                message: 'Yangi buyurtma yarating',
                actionText: 'Yangi suhbat',
                onAction: () {},
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 300,
              decoration: BoxDecoration(border: Border.all(color: context.colors.border)),
              child: ErrorState(title: 'Xatolik', onAction: () {}),
            ),
          ]),
          _buildSection('ProductCard', [
            const ProductCard(
              data: ProductCardData(
                id: '1',
                name: 'Velvet Milano',
                price: 180000,
                priceUnit: PriceUnit.perSqm,
                colorHex: '5C6663',
                colorName: 'Grafit',
              ),
              isCarousel: true,
            ),
          ]),
          if (showAnimations)
            _buildSection('Waveform', [
              const Waveform(
                amplitudes: [
                  0.1,
                  0.5,
                  0.8,
                  1.0,
                  0.6,
                  0.3,
                  0.2,
                  0.5,
                  0.9,
                  0.4,
                  0.1,
                  0.2,
                  0.6,
                  0.8,
                  0.9,
                  0.4,
                  0.2,
                  0.1,
                  0.3,
                  0.7,
                  0.5,
                  0.2,
                  0.1,
                  0.0,
                ],
              ),
            ]),
          _buildSection('AppTabBar', [
            AppTabBar(
              currentIndex: 0,
              onTap: (_) {},
              items: const [
                AppTabBarItem(icon: AppIcons.chat, activeIcon: AppIcons.chat, label: 'Chat'),
                AppTabBarItem(
                  icon: AppIcons.orders,
                  activeIcon: AppIcons.orders,
                  label: 'Buyurtmalar',
                  hasBadge: true,
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.text.titleL),
              const SizedBox(height: 12),
              ...children,
            ],
          );
        },
      ),
    );
  }
}
