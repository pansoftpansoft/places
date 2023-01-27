import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:provider/provider.dart';

///
class ListViewTab2 extends StatelessWidget {
  ///
  const ListViewTab2({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

//   @override
//   Widget build(BuildContext context) => BlocBuilder<VisitedTabBloc, VisitedTabState>(
//       builder: (context, state) {
//       return ListView.builder(
// //        itemCount: mocksVisited.length,
//         //itemCount: state!.props!.first!.,
//         itemCount: mocksVisited.length,
//             itemBuilder: (context, index) => CardPlace(
//               mocksVisited[index],
//               iconDelete: true,
//               goal: mocksVisited[index].visitedDate == null
//                   ? ''
//                   : '$goalBeen ${DateFormat('dd-MM-yyyy').format(
//                       mocksVisited[index].visitedDate!,
//                     )}',
//               //key: ValueKey(mocksVisited[index].name),
//               actionOnDelete: () {
//                 _actionOnDelete(context, index);
//               },
//             ),
//           );
//     },
//   );

  // void _actionOnDelete(BuildContext context, int index) {
  //   context
  //       .read<WantVisitTabBloc>()
  //       .add(WantVisitTabRemovePlaceEvent(mocksVisited[index]));
  // }
}
