import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/models/app_model.dart';

class OnboardingScreenModel extends ChangeNotifier {
  ///Показывать кнопку на старт или кнопку пропустить
  static bool buttonOnVisible = false;

  /// Номер страницы
  static double numberPage = 1;

  /// Вызов OnboardingScreen из мену Setting
  /// что бы вернутся в Setting
  static bool callingFromSettings = false;

  static String fileName = '';

  static void onPageChanged(double? page) {
    numberPage = page!;
    debugPrint(numberPage.toString());
    if (page == 2) {
      buttonOnVisible = true;
      debugPrint(page.toString());
    } else {
      buttonOnVisible = false;
      debugPrint(numberPage.toString());
    }

    switch (numberPage.toInt()) {
      case 0:
        debugPrint('101');
        fileName = AppModel.isThemeColor ? SvgIcons.white1 : SvgIcons.black1;
        break;
      case 1:
        debugPrint('102');
        fileName = AppModel.isThemeColor ? SvgIcons.white2 : SvgIcons.black2;
        break;
      case 2:
        debugPrint('103');
        fileName = AppModel.isThemeColor ? SvgIcons.white3 : SvgIcons.black3;
        break;
      default:
        debugPrint('104');
        fileName = SvgIcons.onboardProgress1;
    }
  }

  void notify() {
    debugPrint('Пришло обновление');
    notifyListeners();
  }
}
