import 'package:flutter/material.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/loader_size.dart';

class Loader extends StatefulWidget {
  final LoaderSize imageSize;

  const Loader(this.imageSize, {Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controllerRotation = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat();

  late final Animation<double> _animationRotation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerRotation,
      curve: Curves.linear,
    ),
  );

  @override
  void dispose() {
    _controllerRotation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final themes = Theme.of(context).brightness;

    String imageFileName;

    switch (widget.imageSize) {
      case LoaderSize.small:
        imageFileName =
            themes == Brightness.light ? loaderLightSmall : loaderDarkSmall;
        break;
      case LoaderSize.large:
        imageFileName =
            themes == Brightness.light ? loaderLightLarge : loaderDarkLarge;
        break;
    }

    return RotationTransition(
      turns: _animationRotation,
      child: Center(
        child: Image.asset(imageFileName),
      ),
    );
  }
}
