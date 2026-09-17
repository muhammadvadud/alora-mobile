/// Limit oshgandagi xatti-harakat (api `on_exceed`: warn|block).
enum OnExceed {
  warn('warn'),
  block('block'),
  unknown('unknown');

  const OnExceed(this.query);

  /// Backend maydon qiymati.
  final String query;

  static OnExceed fromName(String value) {
    for (final item in OnExceed.values) {
      if (item.query == value) return item;
    }
    return OnExceed.unknown;
  }
}
