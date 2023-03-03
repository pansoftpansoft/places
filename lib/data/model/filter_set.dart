import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';

class FilterSet {

  Set<String> selectedCategory={};


  late Set<FilterCategory> _savedCategoryFilter;

  Set<FilterCategory> get savedCategoryFilter {

  return _savedCategoryFilter;
  }

  set savedCategoryFilter(Set<FilterCategory> value) {
    _savedCategoryFilter = value;
  }

  FilterSet(this.selectedCategory);
}
