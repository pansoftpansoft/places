import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';

/// Заголовки полей ввода
class TitleField extends StatelessWidget {
  ///
  final String label;

  ///
  const TitleField(
    this.label, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Opacity(
                opacity: opacityText,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 12,
                      ),
                ),
              ),
              // Разделитель
              const SizedBox12(),
            ],
          ),
        ],
      );
}
