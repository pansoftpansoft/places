import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_bottom_sheet_body.dart';

///
class SelectCategoryBottomSheet extends StatelessWidget {
  ///
  const SelectCategoryBottomSheet({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: SelectCategoryBottomSheetBody(),
      );
}
