/// Suhbat → buyurtma konversiyasi (API-CONTRACT 10.4).
///
/// Backend hozircha `conversion_rate` maydonini qaytarmaydi (faqat
/// `total_conversations` va `with_order`), shuning uchun [conversionRate] `null`.
class ConversionStats {
  final int totalConversations;
  final int withOrder;
  final double? conversionRate;

  const ConversionStats({
    this.totalConversations = 0,
    this.withOrder = 0,
    this.conversionRate,
  });
}
