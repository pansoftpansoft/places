import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';

class SightCardSearchTextSpan extends StatelessWidget {
  final Sight sight;
  final String searchText;

  const SightCardSearchTextSpan(
    this.sight,
    this.searchText, {
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
              text: '',
              style: Theme.of(context).textTheme.subtitle1,
              children: _textColLor(context, sight.name, searchText),
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

  List<InlineSpan> _textColLor(
    BuildContext context,
    String sightName,
    String searchText,
  ) {
    int start = 0;
    int end = 0;

    if (searchText.isEmpty) {
      start = sightName.length - 1;
      end = sightName.length - 1;
    } else {
      start = sightName.toLowerCase().indexOf(searchText.toLowerCase());
      if (start < 0) {
        start = sightName.length - 1;
        end = sightName.length - 1;
      } else {
        end = start + searchText.length;
      }
    }

    List<InlineSpan> listText = [
      TextSpan(
        text: sight.name.substring(0, start),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w400),
      ),
      TextSpan(
        text: sight.name.substring(start, end),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      TextSpan(
        text: sight.name.substring(end, sightName.length),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w400),
      ),
    ];

    return listText;
  }
}
