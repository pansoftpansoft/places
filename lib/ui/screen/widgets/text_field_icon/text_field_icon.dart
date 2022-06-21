import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/widgets/text_field_icon/icon_prefix.dart';
import 'package:places/ui/screen/widgets/text_field_icon/icon_suffix.dart';
import 'package:places/ui/screen/widgets/text_field_icon/icon_suffix_for_text.dart';

///Универсальное полу ввода с иконками в префиксе и суфиксу
///с заданием действий при нажатии на эти иконки

class TextFieldIcon extends StatefulWidget {
  ///
  final TextAlignVertical textAlignVertical;

  ///
  final TextEditingController? controller;

  ///
  final ValueChanged<TextEditingController>? textEditingControllerFunction;

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

  // ///
  // final String textValue;
  ///
  final ValueChanged<String>? actionOnSubmitted;

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

  ///
  final VoidCallback? onTap;

  ///
  final ValueChanged<String>? onChanged;

  final Color? cursorColor;

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
    this.actionOnSubmitted,
    this.maxLines = 1,
    this.inputFormatters,
    this.textAlignVertical = TextAlignVertical.center,
    this.labelText,
    this.borderColor = ColorPalette.greenColor,
    this.fillColor,
    this.onTap,
    this.onChanged,
    this.cursorColor,
    final Key? key,
  }) : super(key: key);

  @override
  _TextFieldIconState createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  bool suffixIconVisibleForText = false;

  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  TextInputType? _keyboardType;

  bool _filled = true;

  @override
  //void dispose() {
  //_textEditingController.dispose();
  //_focusNode.dispose();
  // super.dispose();
  //}

  @override
  void initState() {
    super.initState();

    _filled = widget.fillColor != null;

    _textEditingController = widget.controller ?? TextEditingController();

    _focusNode = widget.focusNode ?? FocusNode();

    _keyboardType = widget.keyboardType ??
        (widget.maxLines == 1 ? TextInputType.text : TextInputType.multiline);

    textEditingControllerAddListener();

    focusNodeAddListener();
  }

  @override
  Widget build(final BuildContext context) => TextField(
        cursorColor: widget.cursorColor,
        maxLines: widget.maxLines,
        controller: _textEditingController,
        focusNode: _focusNode,
        keyboardType: _keyboardType,
        autofocus: widget.autofocus,
        textInputAction: TextInputAction.go,
        decoration: buildInputDecoration(),
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
            ),
        textAlignVertical: TextAlignVertical.center,
        onSubmitted: (final value) {
          if (widget.actionOnSubmitted != null) {
            widget.actionOnSubmitted!(value);
          }
        },
        inputFormatters: widget.inputFormatters,
        onChanged: (final value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      );

  void focusNodeAddListener() {
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

  void textEditingControllerAddListener() {
    _textEditingController.addListener(
      () {
        if (!mounted) {
          return;
        }
        if (widget.textEditingControllerFunction != null) {
          widget.textEditingControllerFunction!(_textEditingController);
        }
        if (_textEditingController.text.length == 1) {
          setState(() {
            suffixIconVisibleForText = true;
          });
        }
      },
    );
  }

  InputDecoration buildInputDecoration() {
    debugPrint(
      '_textEditingController.value = '
      '${_textEditingController.value.toString()}',
    );
    debugPrint('_textEditingController.text = ${_textEditingController.text}');
    final text = _textEditingController.value.text;
    suffixIconVisibleForText =
        !(_textEditingController.text.isEmpty & text.isEmpty);
    debugPrint('suffixIconVisibleForText = $suffixIconVisibleForText');

    return InputDecoration(
      labelText: widget.labelText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      suffixIcon: suffixIconVisibleForText
          ? IconSuffixForText(widget)
          : IconSuffix(widget),
      prefixIcon: widget.svgIconPrefix == null ? null : IconPrefix(widget),
      contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      filled: _filled,
      fillColor: widget.fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.borderColor,
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
    );
  }
}
