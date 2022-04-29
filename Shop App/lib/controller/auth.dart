import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/controller/profile.dart';
import 'package:store/screens/login.dart';
import 'package:store/screens/tabs.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ProfileController _profile = Get.put(ProfileController());
  var isUserLoginIn = false.obs;

  onInit() {
    super.onInit();
    validate();
  }

  validate() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        isUserLoginIn.value = true;
        _profile.readStoreDetail();
      } else {
        isUserLoginIn.value = false;
      }
    });
  }

  login(email, password) {
    email = (email).trim().toLowerCase();

    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      Get.offAll(TabsScreen());
      print(res);
    }).catchError((e) {
      print(e);
      Get.showSnackbar(GetSnackBar(
        message: "Wrong Password",
        duration: Duration(seconds: 4),
      ));
    });
  }

  logout() {
    _auth.signOut().then((res) => {Get.offAll(LoginScreen())}).catchError((e) {
      print(e);
    });
  }
}
