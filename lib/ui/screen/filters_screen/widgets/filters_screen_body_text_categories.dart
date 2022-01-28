import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';

class FiltersScreenBodyTextCategories extends StatelessWidget {
  const FiltersScreenBodyTextCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingPage,
      ),
      child: Row(
        children: <Text>[
          Text(
            categories,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
