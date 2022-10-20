import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/details_place_screen/widgets/photo_gallery_picture.dart';
import 'package:places/ui/screen/details_place_screen/widgets/scroll_indicator.dart';

///Галерея фотографий в экране детализация
class PhotoGallery extends StatelessWidget {
  /// Индекс первой фотографии в галереи,
  /// что бы при открытии окна деталий индикатор становил в начало

  final Place place;

  /// Конструктор галереи фотографий в экране детализация
  const PhotoGallery(
    this.place, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPlaceBloc, DetailsPlaceState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            Container(
              height: 360,
              width: double.infinity,
              color: Colors.green,
              child: place.urls.length == 1 && place.urls.first == noPhoto
                  ? Image.asset(
                      noPhoto,
                      height: 120,
                      width: 122,
                    )
                  : PageView.builder(
                      onPageChanged: (index) {
                        context.read<DetailsPlaceBloc>().add(
                              DetailsPlaceEvents.onPageChanged(
                                place,
                                index: index,
                              ),
                            );
                      },
                      itemCount: place.urls.length,
                      itemBuilder: (context, index) =>
                          PhotoGalleryPicture(place.urls[index]),
                    ),
            ),
            Positioned(
              bottom: 0,
              child: ScrollIndicator(
                countElements: place.urls.length,
                index: state.index,
              ),
            ),
          ],
        );
      },
    );
  }
}
