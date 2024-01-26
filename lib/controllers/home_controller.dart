import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  var navIndex = 0.obs;
  var username = '';

Future<String> getUsername() async {
    var n = await firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'] as String;
      } else {
        return ''; // Nilai default jika dokumen tidak ditemukan
      }
    });

    return n; // Mengembalikan nilai dari fungsi
  }

// Penggunaan fungsi getUsername
  void main() async {
    username = await getUsername();
    print(username);
  }
}
  // getUsername() async {
  //   var n = await firestore
  //       .collection(vendorsCollection)
  //       .where('id', isEqualTo: currentUser!.uid)
  //       .get()
  //       .then((value) {
  //     if (value.docs.isNotEmpty) {
  //       return value.docs.single['vendor_name'];
  //     }
  //   });

  //   username = n;
  //   print(username);
  // }

