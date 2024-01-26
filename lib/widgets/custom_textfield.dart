import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

Widget customTextField({label, hint, controller, isDesc = false}) {
  return TextFormField(
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: label, color: fontGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: purpleColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: purpleColor,
        ),
      ),
      hintText: hint,
      hintStyle: const TextStyle(color: darkGrey),
    ),
  );
}
