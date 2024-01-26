import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class ProductsDetails extends StatelessWidget {
  final dynamic data;
  const ProductsDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: darkGrey,
            )),
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: data['p_imgs'].length,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  // title
                  boldText(
                      text: "${data['p_name']}", color: fontGrey, size: 16.0),

                  // title!.text
                  //     .size(16)
                  //     .color(darkFontGrey)
                  //     .fontFamily(semibold)
                  //     .make(),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                          text: "$data{'p_category'}",
                          color: fontGrey,
                          size: 16.0),
                      10.widthBox,
                      normalText(
                          text: "$data{'p_subcategory'}",
                          color: fontGrey,
                          size: 16.0),
                    ],
                  ),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,

                  boldText(text: "${data['p_price']}", color: red, size: 16.0),
                  // "Rp.${data['p_price']}"
                  //     .text
                  //     .color(unguColor)
                  //     .size(18)
                  //     .fontFamily(bold)
                  //     .make(),
                  20.heightBox,

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: normalText(text: 'Color', color: fontGrey),
                            // child: 'Color'.text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                              data['p_colors'].length,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  // .color(Vx.randomPrimaryColor)
                                  .color(Color(data['p_colors'][index])
                                      .withOpacity(1.0))
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()
                                  .onTap(
                                () {
                                  // controller
                                  //     .changeColorIndex(index);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: normalText(text: 'Qty', color: fontGrey),
                            // child: 'Quantity'.text.color(textfieldGrey).make(),
                          ),
                          normalText(
                              text: "${data['p_quantity']} items",
                              color: fontGrey)
                        ],
                      ),
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).shadowSm.make(),
                  const Divider(),
                  20.heightBox,
                  boldText(text: 'Description', color: fontGrey),
                  // 'Deskripsi'
                  //     .text
                  //     .color(darkFontGrey)
                  //     .fontFamily(semibold)
                  //     .make(),
                  10.heightBox,
                  normalText(text: "${data['p_desc']}", color: fontGrey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
