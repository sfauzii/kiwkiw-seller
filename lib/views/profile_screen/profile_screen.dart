import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/controllers/auth_controller.dart';
import 'package:kiwkiw_seller/controllers/profile_controller.dart';
import 'package:kiwkiw_seller/services/store_services.dart';
import 'package:kiwkiw_seller/views/auth_screen/login_screen.dart';
import 'package:kiwkiw_seller/views/messages_screen/messages_screen.dart';
import 'package:kiwkiw_seller/views/profile_screen/edit_profile_screen.dart';
import 'package:kiwkiw_seller/views/shop_screen/shop_screen_settings.dart';
import 'package:kiwkiw_seller/widgets/loading_indicator.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0, color: fontGrey),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const EditProfileScreen());
              // username:
              // controller.snapshotData['vendor_name'];
            },
            icon: const Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () async {
              await Get.find<AuthController>().signoutMethod(context);
              Get.offAll(() => const LoginScreen());
            },
            child: normalText(text: logout, color: fontGrey),
          ),
        ],
      ),
      body: FutureBuilder(
          future: StoreServices.getProfile(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return loadingIndicator(circleColor: purpleColor);
            } else {
              controller.snapshotData = snapshot.data!.docs[0];
              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(imgProduct)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    title: boldText(
                        text: "${controller.snapshotData['vendor_name']}",
                        color: fontGrey),
                    subtitle: normalText(
                        text: "${controller.snapshotData['email']}",
                        color: fontGrey),
                  ),
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          profileButtonIcons.length,
                          (index) => ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(() => const ShopSettings());
                                      break;
                                    case 1:
                                      Get.to(() => const MessagesScreen());
                                      break;
                                    default:
                                  }
                                },
                                leading: Icon(profileButtonIcons[index]),
                                title: normalText(
                                    text: profileButtonTitle[index],
                                    color: fontGrey),
                              )),
                    ),
                  )
                ],
              );
            }
          }),
      // body: Column(
      //   children: [
      //     ListTile(
      //       leading: Image.asset(imgProduct)
      //           .box
      //           .roundedFull
      //           .clip(Clip.antiAlias)
      //           .make(),
      //       title: boldText(text: 'Vendor Name', color: fontGrey),
      //       subtitle: normalText(text: 'vendor@gmail.com', color: fontGrey),
      //     ),
      //     const Divider(),
      //     10.heightBox,
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         children: List.generate(
      //             profileButtonIcons.length,
      //             (index) => ListTile(
      //                   onTap: () {
      //                     switch (index) {
      //                       case 0:
      //                         Get.to(() => const ShopSettings());
      //                         break;
      //                       case 1:
      //                         Get.to(() => const MessagesScreen());
      //                         break;
      //                       default:
      //                     }
      //                   },
      //                   leading: Icon(profileButtonIcons[index]),
      //                   title: normalText(
      //                       text: profileButtonTitle[index], color: fontGrey),
      //                 )),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
