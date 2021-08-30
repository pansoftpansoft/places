import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

class TextFieldIcon extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? focusNodeNext;
  final TextInputType? keyboardType;
  final String? svgPictureSuffix;
  final Color? svgPictureSuffixColor;
  final double borderRadius;
  final double heightIcon;
  final int maxLines;
  final VoidCallback? actionIconSuffix;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldIcon({
    Key? key,
    this.controller,
    this.focusNode,
    this.focusNodeNext,
    this.keyboardType,
    this.svgPictureSuffix,
    this.svgPictureSuffixColor,
    this.heightIcon = 20,
    this.borderRadius = 0,
    this.maxLines = 1,
    this.actionIconSuffix,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _TextFieldIconState createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  TextInputType? _keyboardType;
  bool suffixIconVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = widget.controller ?? TextEditingController();

    _focusNode = widget.focusNode ?? FocusNode();

    _keyboardType = widget.keyboardType ??
        (widget.maxLines == 1 ? TextInputType.text : TextInputType.multiline);

    _textEditingController.addListener(
      () {
        if (_textEditingController.text.isEmpty) {
          setState(() {
            suffixIconVisible = false;
          });
        }
        if (_textEditingController.text.length == 1) {
          setState(() {
            suffixIconVisible = true;
          });
        }
      },
    );
    _focusNode.addListener(
      () {
        if (_textEditingController.text.isNotEmpty && _focusNode.hasFocus) {
          setState(
            () {
              suffixIconVisible = true;
            },
          );
        } else {
          setState(
            () {
              suffixIconVisible = false;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      controller: _textEditingController,
      focusNode: _focusNode,
      keyboardType: _keyboardType,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        suffixIcon: suffixIconVisible
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
                child: IconClear(),
              )
            : const SizedBox.shrink(),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.greenColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.greenColor,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
      ),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w400,
          ),
      textAlignVertical: TextAlignVertical.center,
      onSubmitted: (value) => widget.focusNodeNext == null
          ? FocusManager.instance.primaryFocus!.unfocus()
          : widget.focusNodeNext!.requestFocus(),
      inputFormatters: widget.inputFormatters,


    );
  }

  Widget IconClear() {
    return InkWell(
      onTap: widget.actionIconSuffix,
      child: SvgPicture.asset(
        widget.svgPictureSuffix.toString(),
        height: widget.heightIcon,
        color: ColorPalette.lmIcon,
      ),
    );
  }
}
