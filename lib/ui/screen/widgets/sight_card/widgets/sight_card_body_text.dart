import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_text_go_need.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_text_goal.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/size_box_height.dart';

class SightCardBodyText extends StatelessWidget {
  final String goNeed;
  final String goal;
  final double heightImage;
  final Place _sight;

  const SightCardBodyText({
    Key? key,
    required this.heightImage,
    required Place sight,
    required this.goNeed,
    required this.goal,
  })  : _sight = sight,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingPage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizeBoxHeight(),
          Text(
            _sight.name,
            maxLines: maxLines2,
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,
          ),
          if (goNeed != '' && goal == '')
            SightCardBodyTextGoNeed(
              padding: padding10,
              goNeed: goNeed,
              maxLines: maxLines5,
            ),
          if (goNeed == '' && goal != '')
            SightCardBodyTextGoal(
              padding: padding10,
              goal: goal,
              maxLines: maxLines5,
            ),
          Text(
            shortDescription,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
