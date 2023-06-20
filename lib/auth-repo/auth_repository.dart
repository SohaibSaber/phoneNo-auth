import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRep extends GetxController {
  static AuthenticationRep get instance => Get.find();
  

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  Future<void> phoneAuth(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid');
        }else{
          Get.snackbar('Error', 'Something went wrong');
        }
      },
    );
  }
  Future<bool> verifyOTP (String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user !=null ? true : false;
  }
}
