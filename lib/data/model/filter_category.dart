class FilterCategory {
  final String category;
  final int orderCategory;
  int categoryValue;

  FilterCategory(
    this.category,
    this.orderCategory,
    this.categoryValue,
  );

  factory FilterCategory.fromMap(
    final Map<String, dynamic> mapFilter,
  ) =>
      FilterCategory(
        mapFilter['category'] as String,
        mapFilter['orderCategory'] as int,
        mapFilter['categoryValue'] as int,
      );

  Map<String, Object?> toMap() => {
        'category': category,
        'orderCategory': orderCategory,
        'categoryValue': categoryValue,
      };
}
