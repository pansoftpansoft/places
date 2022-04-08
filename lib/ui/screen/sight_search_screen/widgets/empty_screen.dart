import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Пустой экран
class EmptyScreen extends StatefulWidget {
  ///
  final String textHeader;

  ///
  final String textComment;

  ///
  final String svgIcon;

  ///
  final Color? colorTextAll;


  ///
  const EmptyScreen({
    required this.textHeader,
    required this.svgIcon,
    required this.textComment,
    this.colorTextAll,
    final Key? key,
  }) : super(key: key);


  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(final BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              widget.svgIcon,
              width: 60,
              color: widget.colorTextAll,
            ),
            Text(
              widget.textHeader,
              style: TextStyle(color: widget.colorTextAll, fontSize: 18),
            ),
            Text(
              widget.textComment,
              style: TextStyle(color: widget.colorTextAll, fontSize: 14),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('textHeader', widget.textHeader));
  }
}
