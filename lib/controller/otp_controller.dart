import 'package:get/get.dart';
import 'package:phone_auth_firbase/auth-repo/auth_repository.dart';

import '../pages/dashboard.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRep.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}