import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_set.freezed.dart';


@freezed
class FilterSet  with _$FilterSet {

  const factory FilterSet({

    @Default(<String>{}) Set<String> selectedCategory,
    @Default(RangeValues(100, 1000)) RangeValues rangeDistance,
    @Default(0) int quantitySelectedPlaces,
  }) = _FilterSet;


}
