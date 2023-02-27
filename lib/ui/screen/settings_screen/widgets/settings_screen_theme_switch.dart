import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/settings_screen/bloc/settings_bloc.dart';

class SettingsScreenThemeSwitch extends StatelessWidget {
  const SettingsScreenThemeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              darkTheme,
              style: Theme.of(context).textTheme.headline2,
            ),
            CupertinoSwitch(
              value: state.themeData,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvents.updateSettings(
                        themeData: value,
                        firstStart: state.firstStart,
                      ),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
