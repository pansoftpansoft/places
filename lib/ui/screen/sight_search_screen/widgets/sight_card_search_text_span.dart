import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';

class SightCardSearchTextSpan extends StatelessWidget {
  final Sight sight;

  const SightCardSearchTextSpan(
    this.sight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: sight.name.substring(0, 4),
              style: Theme.of(context).textTheme.subtitle1,
              children: <InlineSpan>[
                TextSpan(
                  text: sight.name.substring(4),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            typePlaceString(sight.type),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
