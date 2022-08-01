import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [AddPlaceScreenWidgetModel]
AddPlaceScreenWidgetModel addPlaceScreenWidgetModelFactory(
    BuildContext context,
    ) {
  final model = context.read<AddPlaceScreenModel>();

  return AddPlaceScreenWidgetModel(model);
}



class AddPlaceScreenWidgetModel
    extends WidgetModel<AddPlaceScreen, AddPlaceScreenModel>
    implements IAddPlaceScreenWidgetModel {


  final _placeState = EntityStateNotifier<PlaceDto>();
  final _placeDto = PlaceDto(name: '', placeType: '');

  @override
  ListenableState<EntityState<PlaceDto>> get placeState => _placeState;


  AddPlaceScreenWidgetModel(
    AddPlaceScreenModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadAddPlaceScreen();
  }

  
  
  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    if (error is DioError &&
        (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Connection troubles')));
    }
  }

  Future<void> _sendNewPlaceToServer() async {
    final previousData = _placeState.value?.data;
    try {
      final res = await model.postPlace();
      _placeState.content(res);
    } on Exception catch (e) {
      _placeState.error(e, previousData);
    }
  }

  void _loadAddPlaceScreen() {
    //_placeState.loading(_placeDto);
    _placeState.content(_placeDto);
  }
}

/// Interface [AddPlaceScreenWidgetModel]
abstract class IAddPlaceScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<PlaceDto>> get placeState;
}
