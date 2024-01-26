import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      primary: color,
      padding: const EdgeInsets.all(12)
    ),
    onPressed: onPress,
    child: boldText(
      text: title,
      size: 16.0,
    ),
  );
}
