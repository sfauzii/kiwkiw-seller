import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/controllers/products_controller.dart';
import 'package:kiwkiw_seller/services/store_services.dart';
import 'package:kiwkiw_seller/views/products_screen/add_product.dart';
import 'package:kiwkiw_seller/views/products_screen/products_details.dart';
import 'package:kiwkiw_seller/widgets/appbar_widget.dart';
import 'package:kiwkiw_seller/widgets/loading_indicator.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class ProdutsScreen extends StatelessWidget {
  const ProdutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {
          await controller.getCategories();
          controller.populateCategoryList();

          Get.to(() => const AddProduct());
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appbarWidget(products),

      body: StreamBuilder(
          stream: StoreServices.getProducts(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      data.length,
                      (index) => ListTile(
                        onTap: () {
                          Get.to(() => ProductsDetails(
                                data: data[index],
                              ));
                        },
                        leading: Image.network(
                          data[index]['p_imgs'][0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                          text: "${data[index]['p_name']}",
                          color: fontGrey,
                        ),
                        subtitle: Row(
                          children: [
                            normalText(
                                text: "${data[index]['p_price']}",
                                color: darkGrey),
                            10.widthBox,
                            boldText(
                                text: data[index]['is_featured'] == true
                                    ? "Featured"
                                    : '',
                                color: green),
                          ],
                        ),
                        trailing: VxPopupMenu(
                            arrowSize: 0.0,
                            menuBuilder: () => Column(
                                  children: List.generate(
                                    popupMenuTitle.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(popupMenuIcons[index]),
                                          10.widthBox,
                                          normalText(
                                              text: popupMenuTitle[index],
                                              color: darkGrey)
                                        ],
                                      ).onTap(() {}),
                                    ),
                                  ),
                                ).box.white.rounded.width(200).make(),
                            clickType: VxClickType.singleClick,
                            child: const Icon(Icons.more_vert_rounded)),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     physics: const BouncingScrollPhysics(),
      //     child: Column(
      //       children: List.generate(
      //         20,
      //         (index) => ListTile(
      //           onTap: () {
      //             Get.to(() => const ProductsDetails());
      //           },
      //           leading: Image.asset(
      //             imgProduct,
      //             width: 100,
      //             height: 100,
      //             fit: BoxFit.cover,
      //           ),
      //           title: boldText(
      //             text: 'Products title',
      //             color: fontGrey,
      //           ),
      //           subtitle: Row(
      //             children: [
      //               normalText(text: 'Rp. 500.000', color: darkGrey),
      //               10.widthBox,
      //               boldText(text: 'Featured', color: green),
      //             ],
      //           ),
      //           trailing: VxPopupMenu(
      //               arrowSize: 0.0,
      //               menuBuilder: () => Column(
      //                     children: List.generate(
      //                       popupMenuTitle.length,
      //                       (index) => Padding(
      //                         padding: const EdgeInsets.all(12.0),
      //                         child: Row(
      //                           children: [
      //                             Icon(popupMenuIcons[index]),
      //                             10.widthBox,
      //                             normalText(
      //                                 text: popupMenuTitle[index],
      //                                 color: darkGrey)
      //                           ],
      //                         ).onTap(() {}),
      //                       ),
      //                     ),
      //                   ).box.white.rounded.width(200).make(),
      //               clickType: VxClickType.singleClick,
      //               child: const Icon(Icons.more_vert_rounded)),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
