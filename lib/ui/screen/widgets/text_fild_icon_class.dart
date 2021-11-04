import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// decoration: InputDecoration(
// hintText: Labels.search,
// hintStyle: const TextStyle(color: ColorPalette.textInTextField),
// filled: true,
// fillColor: ColorPalette.filledTextField,
// enabledBorder: const OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(12)),
// borderSide: BorderSide(color: Colors.transparent)),
// focusedBorder: const OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(12)),
// borderSide: BorderSide(color: Colors.transparent)),
// isCollapsed: true,
// prefixIcon: Padding(
// padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// child: SvgPicture.asset(
// SvgIcons.search,
// color: ColorPalette.textInTextField,
// ),
// ),
// suffixIcon: Padding(
// padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// child: IconFilter(context),
// ),
// ),

///
class TextFieldIcon extends TextField {
  final FocusNode? focusNodeNext;
  final String? svgPictureSuffix;
  final Color? svgPictureSuffixColor;
  final double? borderRadius;
  final double? heightIcon;
  final VoidCallback? actionIconSuffix;

  const TextFieldIcon({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization = TextCapitalization.none,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? readOnly,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    bool? autofocus,
    String? obscuringCharacter,
    bool? obscureText,
    bool? autocorrect,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    int? maxLength,
    bool? maxLengthEnforced,
    MaxLengthEnforcement? maxLengthEnforcement,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    void Function(String)? onSubmitted,
    void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    ui.BoxHeightStyle? selectionHeightStyle,
    ui.BoxWidthStyle? selectionWidthStyle,
    Brightness? keyboardAppearance,
    EdgeInsets? scrollPadding,
    DragStartBehavior? dragStartBehavior,
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    void Function()? onTap,
    MouseCursor? mouseCursor,
    Widget? Function(
      BuildContext, {
      required int currentLength,
      required bool isFocused,
      required int? maxLength,
    })?
        buildCounter,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    String? restorationId,
    this.focusNodeNext,
    this.svgPictureSuffix,
    this.svgPictureSuffixColor,
    this.borderRadius,
    this.heightIcon,
    this.actionIconSuffix,
  }) : super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign == null ? TextAlign.start : textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          readOnly: readOnly == null ? false : readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          autofocus: autofocus == null ? false : autofocus,
          obscuringCharacter:
              obscuringCharacter == null ? '•' : obscuringCharacter,
          obscureText: obscureText == null ? false : obscureText,
          autocorrect: autocorrect == null ? true : autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions:
              enableSuggestions == null ? true : enableSuggestions,
          maxLines: maxLines == null ? 1 : maxLines,
          minLines: minLines,
          expands: expands == null ? false : expands,
          maxLength: maxLength,
          //maxLengthEnforced : maxLengthEnforced,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          onAppPrivateCommand: onAppPrivateCommand,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth == null ? 2.0 : cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          selectionHeightStyle: selectionHeightStyle == null
              ? ui.BoxHeightStyle.tight
              : selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle == null
              ? ui.BoxWidthStyle.tight
              : selectionWidthStyle,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding == null
              ? const EdgeInsets.all(20.0)
              : scrollPadding,
          dragStartBehavior: dragStartBehavior == null
              ? DragStartBehavior.start
              : dragStartBehavior,
          enableInteractiveSelection: enableInteractiveSelection == null
              ? true
              : enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          mouseCursor: mouseCursor,
          buildCounter: buildCounter,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          restorationId: restorationId,
        );
}
