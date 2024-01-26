import 'package:kiwkiw_seller/const/const.dart';

Widget normalText({text, color = Colors.white, size = 14.0}) {
  return "$text".text.color(color).size(size).make();
}
// Widget normalText({text, String color = 'white', double size = 14.0}) {
//   return Text(
//     "$text",
//     style: TextStyle(color: _parseColor(color), fontSize: size),
//   );
// }

// Color _parseColor(String colorString) {
//   if (colorString.startsWith('#') && colorString.length == 7) {
//     return Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000);
//   }
//   return Colors.white; // Default jika string warna tidak valid
// }
Widget boldText({text, color = Colors.white, size = 14.0}) {
  return "$text".text.semiBold.color(color).size(size).make();
}
