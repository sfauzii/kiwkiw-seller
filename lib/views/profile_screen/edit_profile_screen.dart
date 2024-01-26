import 'dart:io';

import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/controllers/profile_controller.dart';
import 'package:kiwkiw_seller/widgets/custom_textfield.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: editProfile, size: 16.0, color: fontGrey),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: normalText(text: save, color: fontGrey),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            controller.snapshotData['imageUrl'] == '' &&
                    controller.profileImgPath.isEmpty
                ? Image.asset(imgProduct, width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : controller.snapshotData['imageUrl'] != '' &&
                        controller.profileImgPath.isEmpty
                    ? Image.network(controller.snapshotData['imageUrl'],
                            width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            // Image.asset(
            //   imgProduct,
            //   width: 150,
            // ).box.roundedFull.clip(Clip.antiAlias).make(),
            20.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: purpleColor),
              onPressed: () {
                controller.changeImage(context);
              },
              child: normalText(text: changeImage, color: white),
            ),
            10.heightBox,
            const Divider(),
            customTextField(
                label: name,
                hint: 'eg. SpeechlessMind',
                controller: controller.nameController),
            10.heightBox,
            Align(
                alignment: Alignment.centerLeft,
                child: boldText(text: 'Change your password', color: fontGrey)),
            10.heightBox,
            customTextField(
                label: password,
                hint: passwordHint,
                controller: controller.oldpassController),
            10.heightBox,
            customTextField(
                label: confirmPass,
                hint: passwordHint,
                controller: controller.newpassController),
          ],
        ),
      ),
    );
  }
}
