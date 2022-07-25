// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_places_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListPlacesStore on ListPlacesStoreBase, Store {
  late final _$getListPlaceFutureAtom =
      Atom(name: 'ListPlacesStoreBase.getListPlaceFuture', context: context);

  @override
  ObservableFuture<List<Place>>? get getListPlaceFuture {
    _$getListPlaceFutureAtom.reportRead();
    return super.getListPlaceFuture;
  }

  @override
  set getListPlaceFuture(ObservableFuture<List<Place>>? value) {
    _$getListPlaceFutureAtom.reportWrite(value, super.getListPlaceFuture, () {
      super.getListPlaceFuture = value;
    });
  }

  late final _$ListPlacesStoreBaseActionController =
      ActionController(name: 'ListPlacesStoreBase', context: context);

  @override
  void getListPlace() {
    final _$actionInfo = _$ListPlacesStoreBaseActionController.startAction(
        name: 'ListPlacesStoreBase.getListPlace');
    try {
      return super.getListPlace();
    } finally {
      _$ListPlacesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getListPlaceFuture: ${getListPlaceFuture}
    ''';
  }
}
