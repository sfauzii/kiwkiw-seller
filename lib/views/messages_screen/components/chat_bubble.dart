import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

Widget chatBubble() {
  return Directionality(
    // textDirection:
    //     data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        // color: data['uid'] == currentUser!.uid ? unguColor : darkFontGrey,
        color: purpleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "${data['msg']}".text.white.size(16).make(),
          normalText(text: 'your message here...'),
          10.heightBox,
          normalText(text: '10:45PM'),
          // time.text.color(whiteColor.withOpacity(0.5)).make()
        ],
      ),
    ),
  );
}
