class FilterDistance {
  final int distanceCode;
  double distanceStart;
  double distanceEnd;

  FilterDistance(
    this.distanceCode ,
    this.distanceStart,
    this.distanceEnd,
  );

  factory FilterDistance.fromMap(
    final Map<String, dynamic> mapFilter,
  ) =>
      FilterDistance(
        mapFilter['distanceCode'] as int,
        double.tryParse(mapFilter['distanceStart'].toString()) as double,
        double.tryParse(mapFilter['distanceEnd'].toString()) as double,
      );

  Map<String, Object?> toMap() => {
        'distanceCode': distanceCode,
        'distanceStart': distanceStart,
        'distanceEnd': distanceEnd,
      };
}
