import 'package:kiwkiw_seller/const/const.dart';

Widget productImages({required label, onPress}) {
  return "$label"
      .text
      .makeCentered()
      .box
      .color(lightGrey)
      .size(100, 100)
      .roundedSM
      .make();
}
