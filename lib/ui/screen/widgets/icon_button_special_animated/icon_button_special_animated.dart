import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/screen/widgets/circle_avatar_special.dart';
import 'package:places/ui/screen/widgets/icon_button_special_animated/bloc/icon_button_special_animated_bloc.dart';

///
class IconButtonSpecialAnimated extends StatefulWidget {
  ///
  final bool initialState;
  final String iconFirst;
  final String iconSecond;
  final int duration;
  final VoidCallback? onPressed;

  ///
  const IconButtonSpecialAnimated({
    required this.initialState,
    required this.iconFirst,
    required this.iconSecond,
    required this.duration,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IconButtonSpecialAnimatedState();
}

class _IconButtonSpecialAnimatedState extends State<IconButtonSpecialAnimated> {
  late bool _stateIcon;
  late CrossFadeState _crossFadeState;

  @override
  void initState() {
    super.initState();
    _stateIcon = widget.initialState;
    _crossFadeState =
        _stateIcon ? CrossFadeState.showSecond : CrossFadeState.showFirst;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconButtonSpecialAnimatedBloc,
        IconButtonSpecialAnimatedState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _stateIcon = !_stateIcon;
              _crossFadeState = _stateIcon
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst;
            });

            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          child: Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.transparent,
            child: AnimatedCrossFade(
              firstChild: CircleAvatarSpecial(iconName: widget.iconFirst),
              secondChild: CircleAvatarSpecial(iconName: widget.iconSecond),
              duration: Duration(milliseconds: widget.duration),
              crossFadeState: _crossFadeState,
            ),
          ),
        );
      },
    );
  }
}
