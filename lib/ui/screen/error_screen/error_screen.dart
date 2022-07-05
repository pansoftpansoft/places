import 'package:flutter/material.dart';
import 'package:places/ui/screen/error_screen/widgets/safe_area_widget.dart';

///Экран ErrorScreen
class ErrorScreen extends StatelessWidget {
  ///Конструктор ErrorScreen
  const ErrorScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SafeAreaWidget(),
      ),
    );
  }
}
