import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

///Универсальное полу ввода с иконками в префиксе и суфиксу
///с заданием действий при нажатии на эти иконки

class TextFieldIcon extends StatefulWidget {
  ///
  const TextFieldIcon({
    this.controller,
    this.textEditingControllerFunction,
    this.focusNode,
    this.focusNodeNext,
    this.keyboardType,
    this.autofocus = false,
    this.svgIconSuffix,
    this.svgIconSuffixColor,
    this.svgIconSuffixForText,
    this.svgIconSuffixForTextColor,
    this.svgIconPrefix,
    this.svgIconPrefixColor,
    this.heightIcon = 20,
    this.borderRadius = 0,
    this.actionIconSuffix,
    this.actionIconSuffixForText,
    this.actionIconPrefix,
    this.actionOnSubmitted(String value)?,
    this.maxLines = 1,
    this.inputFormatters,
    this.textAlignVertical = TextAlignVertical.center,
    this.labelText,
    this.borderColor = ColorPalette.greenColor,
    this.fillColor,
    final Key? key,
  }) : super(key: key);

  ///
  final TextAlignVertical textAlignVertical;

  ///
  final TextEditingController? controller;

  ///
  final Function? textEditingControllerFunction;

  ///
  final FocusNode? focusNode;

  ///
  final FocusNode? focusNodeNext;

  ///
  final TextInputType? keyboardType;

  ///
  final bool autofocus;

  ///
  final String? svgIconSuffix;

  ///
  final Color? svgIconSuffixColor;

  ///
  final String? svgIconSuffixForText;

  ///
  final Color? svgIconSuffixForTextColor;

  ///
  final String? svgIconPrefix;

  ///
  final Color? svgIconPrefixColor;

  ///
  final VoidCallback? actionIconSuffix;

  ///
  final VoidCallback? actionIconSuffixForText;

  ///
  final VoidCallback? actionIconPrefix;

  ///
  final Function? actionOnSubmitted;

  ///
  final int maxLines;

  ///
  final double borderRadius;

  ///
  final double heightIcon;

  ///
  final String? labelText;

  ///
  final Color borderColor;

  ///
  final Color? fillColor;

  ///
  final List<TextInputFormatter>? inputFormatters;

  @override
  _TextFieldIconState createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  TextInputType? _keyboardType;
  bool suffixIconVisibleForText = false;
  bool _filled = true;

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _filled = widget.fillColor == null ? false : true;

    _textEditingController = widget.controller ?? TextEditingController();

    _focusNode = widget.focusNode ?? FocusNode();

    _keyboardType = widget.keyboardType ??
        (widget.maxLines == 1 ? TextInputType.text : TextInputType.multiline);

    _textEditingController.addListener(
      () {
        if (widget.textEditingControllerFunction != null) {
          widget.textEditingControllerFunction!(_textEditingController);
        }
        if (_textEditingController.text.isEmpty) {
          setState(() {
            suffixIconVisibleForText = false;
          });
        }
        if (_textEditingController.text.length == 1) {
          setState(() {
            suffixIconVisibleForText = true;
          });
        }
      },
    );
    _focusNode.addListener(
      () {
        if (_textEditingController.text.isNotEmpty && _focusNode.hasFocus) {
          setState(
            () {
              suffixIconVisibleForText = true;
            },
          );
        } else {
          setState(
            () {
              suffixIconVisibleForText = false;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(final BuildContext context) => TextField(
        maxLines: widget.maxLines,
        controller: _textEditingController,
        focusNode: _focusNode,
        keyboardType: _keyboardType,
        autofocus: widget.autofocus,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
            child:
                suffixIconVisibleForText ? iconSuffixForText() : iconSuffix(),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
            child: iconPrefix(),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          filled: _filled,
          fillColor: widget.fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: widget.borderColor,
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
        onSubmitted: (final String value) {
          if (widget.actionOnSubmitted != null) {
            widget.actionOnSubmitted!(value);
          }
        },
        inputFormatters: widget.inputFormatters,
      );

  Widget iconSuffix() {
    if (kDebugMode) {
      print('widget.svgIconSuffix ${widget.svgIconSuffix}');
    }

    return widget.svgIconSuffix != null
        ? InkWell(
            onTap: widget.actionIconSuffix,
            child: SvgPicture.asset(
              widget.svgIconSuffix.toString(),
              height: widget.heightIcon,
              color: widget.svgIconSuffixColor,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget? iconSuffixForText() {
    if (kDebugMode) {
      print('widget.svgIconSuffixForText ${widget.svgIconSuffixForText}');
      print(widget.svgIconSuffixForText);
    }

    return widget.svgIconSuffixForText != null
        ? InkWell(
            onTap: widget.actionIconSuffixForText,
            child: SvgPicture.asset(
              widget.svgIconSuffixForText.toString(),
              height: widget.heightIcon,
              color: widget.svgIconSuffixForTextColor,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget? iconPrefix() {
    if (kDebugMode) {
      print('widget.svgIconPrefix ${widget.svgIconPrefix}');
      print(widget.svgIconPrefix);
    }

    return widget.svgIconPrefix != null
        ? InkWell(
            onTap: null,
            child: SvgPicture.asset(
              widget.svgIconPrefix.toString(),
              height: widget.heightIcon,
              color: widget.svgIconPrefixColor,
            ),
          )
        : const SizedBox.shrink();
  }
}
