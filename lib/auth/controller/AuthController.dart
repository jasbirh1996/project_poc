import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_poc/dashboard/professional/MainScreen.dart';
import 'package:project_poc/onboarding/StartPage.dart';

import '../../dashboard/user/UserPage.dart';
import '../../util/OptionController.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final optionSpinner = Get.put(OptionController());

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signUp(String email, String password, String profession) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      var selectedOption = optionSpinner.selectedOption.value.toString();
      print('Selected Option: $selectedOption');

      if (selectedOption == "Professional") {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'category': "professional",
        }).then((value) => {Get.to(Mainscreen())});
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'category': "user",
        }).then((value) => {Get.to(UserPage())});
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {checkUserCategory()});
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void checkUserCategory() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      String category = snapshot['category'];

      if (category == 'professional') {
        // Navigate to professional screen
        Get.to(Mainscreen());
      } else {
        // Navigate to regular user screen
        Get.to(UserPage());
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
