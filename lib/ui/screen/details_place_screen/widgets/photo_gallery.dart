import 'package:flutter/material.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/screen/details_place_screen/widgets/photo_gallery_picture.dart';
import 'package:places/ui/screen/details_place_screen/widgets/scroll_indicator.dart';
import 'package:provider/provider.dart';

///Галерея фотографий в экране детализация
class PhotoGallery extends StatelessWidget {
  /// Индекс первой фотографии в галереи,
  /// что бы при открытии окна деталий индикатор становил в начало
  static const int _index = 0;

  final Place place;

  /// Конструктор галереи фотографий в экране детализация
  const PhotoGallery(
    this.place, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Длина списка с урлами фотографий
    final lengthListUrls = place.urls.length;
    context.read<DetailsPlaceInteractor>().changeScrollIndicator(
          lengthListUrls,
          _index,
        );

    return Stack(
      children: <Widget>[
        Container(
          height: 360,
          width: double.infinity,
          color: Colors.green,
          child: lengthListUrls == 1 && place.urls.first == noPhoto
              ? Image.asset(
                  noPhoto,
                  height: 120,
                  width: 122,
                )
              : PageView.builder(
                  onPageChanged: (index) {
                    context.read<DetailsPlaceInteractor>()
                      ..changeScrollIndicator(
                        lengthListUrls,
                        index,
                      )
                      ..updateScreen();
                  },
                  itemCount: lengthListUrls,
                  itemBuilder: (context, index) =>
                      PhotoGalleryPicture(place.urls[index]),
                ),
        ),
        const Positioned(
          bottom: 0,
          child: ScrollIndicator(),
        ),
      ],
    );
  }
}
