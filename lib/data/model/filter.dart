class Filter {
  final String category;
  final int orderCategory;
   int categoryValue;


  Filter(this.category, this.orderCategory, this.categoryValue,);

  factory Filter.fromMap(
    final Map<String, dynamic> mapFilter,
  ) =>
      Filter(
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
