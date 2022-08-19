import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/data/common/default_error_handler.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [AddPlaceScreenWidgetModel]
AddPlaceScreenWidgetModel addPlaceScreenWidgetModelFactory(
  BuildContext context,
) {
  final addPlaceInteractor = context.read<PlaceInteractor>();
  final ErrorHandler defaultErrorHandler = DefaultErrorHandler();

  final model = AddPlaceScreenModel(addPlaceInteractor, defaultErrorHandler);

  return AddPlaceScreenWidgetModel(model);
}

class AddPlaceScreenWidgetModel
    extends WidgetModel<AddPlaceScreen, AddPlaceScreenModel>
    implements IAddPlaceScreenWidgetModel {
  final _placeState = EntityStateNotifier<Place>();
  final StateNotifier<bool> _fieldNameState = StateNotifier<bool>();
  final StateNotifier<bool> _buttonCreateState = StateNotifier<bool>();
  final TextEditingController _fieldNameController = TextEditingController();

  @override
  ListenableState<EntityState<Place>> get placeState => _placeState;

  @override
  ListenableState<bool> get fieldNameState => _fieldNameState;

  /// состояния кнопки
  @override
  ListenableState<bool> get buttonCreateState => _buttonCreateState;

  @override
  TextEditingController get fieldNameController => _fieldNameController;

  //Конструктор
  AddPlaceScreenWidgetModel(
    AddPlaceScreenModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    _setInitStates();
    _setInitControllers();

    super.initWidgetModel();
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

  @override
  void createPlace() {
    _sendNewPlaceToServer();
  }

  Future<void> _sendNewPlaceToServer() async {
    try {
      final res = await model.postPlace(
        Place(
          name: _fieldNameController.value.text,
          placeType: '',
        ),
      );
      _placeState.content(res);
    } on Exception catch (e) {
      _placeState.error(e);
    }
  }

  /// функция для листенера контроллера поля имени
  void _nameControllerHandle() {
    if (_fieldNameController.text.isNotEmpty) {
      _buttonCreateState.accept(true);
    } else {
      _buttonCreateState.accept(false);
    }
  }

  void _setInitStates() {
    _fieldNameState.accept(false);
    _buttonCreateState.accept(false);
  }

  void _setInitControllers() {
    _fieldNameController.addListener(_nameControllerHandle);
  }
}

/// Interface [AddPlaceScreenWidgetModel]
abstract class IAddPlaceScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<Place>> get placeState;

  ListenableState<bool> get fieldNameState;

  ListenableState<bool> get buttonCreateState;

  TextEditingController get fieldNameController;

  void createPlace();
}
