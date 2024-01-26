import 'package:kiwkiw_seller/const/const.dart';
import 'package:get/get.dart';
import 'package:kiwkiw_seller/controllers/products_controller.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

Widget productDropDown(
    hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: normalText(text: "$hint"),
        value: dropvalue.value == '' ? null : dropvalue.value,
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(
            value: e,
            child: e.toString().text.color(fontGrey).make(),
          );
        }).toList(),
        onChanged: (newValue) {
          if (hint == "Category") {
            controller.subcategoryvalue.value = '';
            controller.populateSubCategory(newValue.toString());
          }
          dropvalue.value = newValue.toString();
        },
      ),
    )
        .box
        .color(lightGrey)
        .padding(const EdgeInsets.symmetric(horizontal: 4))
        .roundedSM
        .make(),
  );
}
