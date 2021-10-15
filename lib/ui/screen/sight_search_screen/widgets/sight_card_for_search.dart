import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

///Карточка достопримечательностей из списка поиска
class SightCardSearch extends StatelessWidget {
  ///
  const SightCardSearch(
    this.sight, {
    final Key? key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

  ///
  final Sight sight;

  ///
  final String goNeed;

  ///
  final String goal;

  ///
  static const double heightImage = 95;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (final BuildContext context) => SightDetails(sight),
            ),
          );
        },
        child: SizedBox(
          height: 78,
          child: Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Image.network(
                  sight.url,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 0, width: 16),
              Flexible(
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
              )
            ],
          ),
        ),
      );
}
