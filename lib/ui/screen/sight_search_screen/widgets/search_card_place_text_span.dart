import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';

class SearchCardPlaceTextSpan extends StatelessWidget {
  final Place place;
  final String searchText;

  const SearchCardPlaceTextSpan(
    this.place,
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
              children: _textColLor(context, place.name, searchText),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            place.placeType,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  List<InlineSpan> _textColLor(
    BuildContext context,
    String placeName,
    String searchText,
  ) {
    var start = 0;
    var end = 0;

    if (searchText.isEmpty) {
      start = placeName.length - 1;
      end = placeName.length - 1;
    } else {
      start = placeName.toLowerCase().indexOf(searchText.toLowerCase());
      if (start < 0) {
        start = placeName.length - 1;
        end = placeName.length - 1;
      } else {
        end = start + searchText.length;
      }
    }

    final listText = <InlineSpan>[
      TextSpan(
        text: place.name.substring(0, start),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w400),
      ),
      TextSpan(
        text: place.name.substring(start, end),
        style: const TextStyle(color: Colors.green),
      ),
      TextSpan(
        text: place.name.substring(end, placeName.length),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w400),
      ),
    ];

    return listText;
  }
}
