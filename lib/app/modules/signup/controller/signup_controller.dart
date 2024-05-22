import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  var isLoading = false.obs;

  Future<void> signUp() async {
    // Check if the passwords match
    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match.');
      return;
    }

    isLoading(true);
    try {
      // Use Firebase Authentication to create a new user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.value
            .trim(), // Trim the email to remove leading/trailing whitespaces
        password: password.value,
      );

      // Navigate to the home screen after successful sign-up
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      // Handle different Firebase Auth errors
      var errorMessage = 'An error occurred, please try again later.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      }

      Get.snackbar('Sign Up Failed', errorMessage);
    } catch (e) {
      // Catch any other errors
      Get.snackbar('Sign Up Failed', 'Error during sign up: $e');
    } finally {
      isLoading(false);
    }
  }
}
