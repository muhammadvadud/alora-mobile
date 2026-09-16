class CursorPagingState<T> {
  final List<T> items;
  final String? nextUrl;
  final bool isLoadingMore;
  final bool hasError;

  const CursorPagingState({
    this.items = const [],
    this.nextUrl,
    this.isLoadingMore = false,
    this.hasError = false,
  });

  bool get hasMore => nextUrl != null;

  CursorPagingState<T> copyWith({
    List<T>? items,
    String? nextUrl,
    bool setNextUrlToNull = false,
    bool? isLoadingMore,
    bool? hasError,
  }) {
    return CursorPagingState<T>(
      items: items ?? this.items,
      nextUrl: setNextUrlToNull ? null : (nextUrl ?? this.nextUrl),
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
    );
  }
}
