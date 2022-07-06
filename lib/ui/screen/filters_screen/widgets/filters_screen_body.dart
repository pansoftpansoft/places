import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_slider.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_slider_header.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_text_categories.dart';
import 'package:places/ui/screen/filters_screen/widgets/grid_icon.dart';
import 'package:provider/provider.dart';

class FiltersScreenBody extends StatelessWidget {
  const FiltersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<FiltersScreenInteractor>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            Column(
          children: const <Widget>[
            FiltersScreenBodyTextCategories(),
            SizedBox(height: 24),
            GridIcon(),
            SizedBox(height: 50),
            FiltersScreenBodySliderHeader(),
            FiltersScreenBodySlider(),
          ],
        ),
      ),
    );
  }
}
