import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/title_field.dart';

class AddSightScreenBodyHeadLatLon extends StatelessWidget {
  const AddSightScreenBodyHeadLatLon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(
          child: TitleField(lat),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: TitleField(
            lon,
          ),
        ),
      ],
    );
  }
}
