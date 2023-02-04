import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/img.dart';

class CardPlaceBodyPicture extends StatefulWidget {
  final double heightImage;
  final Place _place;

  const CardPlaceBodyPicture({
    Key? key,
    required this.heightImage,
    required Place place,
  })  : _place = place,
        super(key: key);

  @override
  State<CardPlaceBodyPicture> createState() => _CardPlaceBodyPictureState();
}

class _CardPlaceBodyPictureState extends State<CardPlaceBodyPicture>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controllerOpacity = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward();

  late final Animation<double> _animationOpacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerOpacity,
      curve: Curves.easeIn,
    ),
  );

  @override
  void dispose() {
    _controllerOpacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationOpacity,
      child: SizedBox(
        width: double.infinity,
        height: widget.heightImage,
        child: (widget._place.urls.length == 1 &&
                widget._place.urls.first == noPhoto)
            ? Image.asset(
                noPhoto,
                height: 120,
                width: 122,
                fit: BoxFit.cover,
              )
            : Image.network(
                widget._place.urls.first,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
