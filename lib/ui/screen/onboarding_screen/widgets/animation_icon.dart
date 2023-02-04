import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationIcon extends StatefulWidget {
  final String svgIcon;

  const AnimationIcon({
    required this.svgIcon,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with TickerProviderStateMixin {
  late final AnimationController _controllerOpacity = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animationOpacity = Tween<double>(
    begin: 0.1,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerOpacity,
      curve: Curves.easeIn,
    ),
  );

  late final AnimationController _controllerScale = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animationScale = Tween<double>(
    begin: 0.1,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerScale,
      curve: Curves.fastOutSlowIn,
    ),
  );

  @override
  void dispose() {
    _controllerOpacity.dispose();
    _controllerScale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationOpacity,
      child: ScaleTransition(
        scale: _animationScale,
        child: SvgPicture.asset(
          widget.svgIcon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
