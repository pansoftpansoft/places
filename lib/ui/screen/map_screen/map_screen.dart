import 'package:flutter/material.dart';
import 'package:places/ui/screen/widgets/bottom_navigation.dart';

///Экран с картой объектов
class MapScreen extends StatelessWidget {
  ///конструктор
  const MapScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationList(1),
        body: Container(
          alignment: Alignment.center,
          child: const Text('Здесь будет карта'),
        ),
      );
}
