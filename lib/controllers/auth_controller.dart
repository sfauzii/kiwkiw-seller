import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kiwkiw_seller/const/const.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

//text controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

// login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // sign out method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
