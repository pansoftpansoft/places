import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
///
class SelectCategoryAppBar extends StatelessWidget {
  const SelectCategoryAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        category,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
