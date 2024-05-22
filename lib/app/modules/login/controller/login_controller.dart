import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  // Updated login function with Firebase Authentication
  void login() async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your email and password');
      return;
    }

    isLoading(true);
    try {
      // Firebase Authentication login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value.trim(), // Trim to remove extra spaces
        password: password.value,
      );
      // If successful, navigate to the base page or dashboard
      Get.offAllNamed('/base');
    } on FirebaseAuthException catch (e) {
      // Handling specific Firebase Auth exceptions
      String errorMessage = 'An unexpected error occurred';
      errorMessage = e.code.toString();
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        errorMessage = e.code.toString();
      }
      Get.snackbar('Login Failed', errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      // Catch any other exceptions
      Get.snackbar('Login Failed', 'Network error or invalid credentials',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
