
import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/controllers/products_controller.dart';
import 'package:kiwkiw_seller/views/products_screen/components/product_dropdown.dart';
import 'package:kiwkiw_seller/views/products_screen/components/product_images.dart';
import 'package:kiwkiw_seller/widgets/custom_textfield.dart';
import 'package:kiwkiw_seller/widgets/loading_indicator.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: darkGrey,
              )),
          title: boldText(text: 'Add Product', color: fontGrey, size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator()
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.uploadImages();
                      await controller.uploadProduct(context);
                      Get.back();
                    },
                    child: boldText(text: save, color: purpleColor),
                  ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                    hint: 'eg. Sepatu Kuda',
                    label: 'Product name',
                    controller: controller.pnameController),
                10.heightBox,
                customTextField(
                    hint: 'eg. Nice product',
                    label: 'Description',
                    isDesc: true,
                    controller: controller.pdescController),
                10.heightBox,
                customTextField(
                    hint: 'eg. Rp.',
                    label: 'Price',
                    controller: controller.ppriceController),
                10.heightBox,
                customTextField(
                    hint: 'eg. 20pcs',
                    label: 'Qty',
                    controller: controller.pquantityController),
                10.heightBox,
                productDropDown("Category", controller.categoryList,
                    controller.categoryValue, controller),
                10.heightBox,
                productDropDown("Subcategory", controller.subcategoryList,
                    controller.subcategoryvalue, controller),
                10.heightBox,
                const Divider(),
                boldText(text: 'Choose product images', color: darkGrey),
                10.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (index) => controller.pImagesList[index] != null
                          ? Image.file(
                              controller.pImagesList[index],
                              width: 100,
                            ).onTap(() {
                              controller.pickImage(index, context);
                            })
                          : productImages(label: "${index + 1}").onTap(() {
                              controller.pickImage(index, context);
                            }),
                    ),
                  ),
                ),
                5.heightBox,
                normalText(
                    text: 'First image will be your display image',
                    color: darkGrey),
                10.heightBox,
                const Divider(),
                boldText(text: 'Choose product colors', color: darkGrey),
                10.heightBox,
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      9,
                      (index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          VxBox()
                              .color(Vx.randomPrimaryColor)
                              .roundedFull
                              .size(50, 50)
                              .make()
                              .onTap(() {
                            controller.selectedColorIndex.value = index;
                          }),
                          controller.selectedColorIndex.value == index
                              ? const Icon(
                                  Icons.done,
                                  color: white,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
