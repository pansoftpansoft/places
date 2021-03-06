import 'package:flutter/material.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';


///Экран с картой объектов
class MapScreen extends StatelessWidget {
  ///конструктор
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigation(1),
        body: Container(
          alignment: Alignment.center,
          child: const Text('Здесь будет карта'),
        ),
      );
}
