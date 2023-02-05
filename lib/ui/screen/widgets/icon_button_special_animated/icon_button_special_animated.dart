import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/screen/widgets/circle_avatar_special.dart';
import 'package:places/ui/screen/widgets/icon_button_special_animated/bloc/icon_button_special_animated_bloc.dart';

///Кнопка с implicit анимацией
class IconButtonSpecialAnimated extends StatefulWidget {
  ///Начальное состояние false и true
  final bool initialState;
  /// Картинка при initialState = false
  final String iconFirst;
  /// Картинка при initialState = true
  final String iconSecond;
  /// продолжительность анимации
  final int animationDuration;
  /// Функция обратного вызова при нажатии на кнопку
  final VoidCallback? onPressed;

  ///
  const IconButtonSpecialAnimated({
    required this.initialState,
    required this.iconFirst,
    required this.iconSecond,
    required this.animationDuration,
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
    // Сохраняем пришедшее состояние
    _stateIcon = widget.initialState;
    // Задаем направление анимации
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
            // поменяем состояние
            setState(
              () {
                _stateIcon = !_stateIcon;
                _crossFadeState = _stateIcon
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst;
              },
            );


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
              duration: Duration(milliseconds: widget.animationDuration),
              crossFadeState: _crossFadeState,
            ),
          ),
        );
      },
    );
  }
}
