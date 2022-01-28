import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:provider/provider.dart';

class SettingsScreenThemeSwitch extends StatelessWidget {
  const SettingsScreenThemeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          darkTheme,
          style: Theme.of(context).textTheme.headline2,
        ),
        CupertinoSwitch(
          value: context.select<AppModel, bool>(
            (final a) => a.isThemeColor,
          ),
          onChanged: (final value) {
            context.read<AppModel>().changeTheme();
          },
        ),
      ],
    );
  }
}