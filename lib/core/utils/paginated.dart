class Paginated<T> {
  final String? next;
  final String? previous;
  final List<T> results;

  const Paginated({
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return Paginated(
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results:
          (json['results'] as List?)?.map((e) => fromJsonT(e)).toList() ?? [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Paginated<T> &&
        other.next == next &&
        other.previous == previous &&
        other.results == results; // simple reference check is fine for typical use, or deep equality
  }

  @override
  int get hashCode => Object.hash(next, previous, results);
}
