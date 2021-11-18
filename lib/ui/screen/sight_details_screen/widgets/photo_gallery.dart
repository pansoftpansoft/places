import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/scroll_indicator.dart';
import 'package:provider/provider.dart';

///Галерея фотографий в экране детализация
class PhotoGallery extends StatelessWidget {
  ///Конструктор галереи фотографий в экране детализация
  const PhotoGallery({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: 360,
            width: double.infinity,
            color: Colors.green,
            child: PageView.builder(
              onPageChanged: (final index) {
                context.read<SightDetailsModel>().changeScrollIndicator(
                      index,
                      MediaQuery.of(context).size.width.ceil(),
                    );
              },
              itemCount: tempPhotoPlace.length,
              itemBuilder: (final context, final index) =>
                  Image.network(
                tempPhotoPlace[index],
                fit: BoxFit.cover,
                loadingBuilder: (
                  final context,
                  final child,
                  final progress,
                ) =>
                    progress == null
                        ? child
                        : const UnconstrainedBox(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            child: ScrollIndicator(),
          ),
        ],
      );
}
