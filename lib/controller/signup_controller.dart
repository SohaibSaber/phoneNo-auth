import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firbase/auth-repo/auth_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final phoneNo = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthenticationRep.instance.phoneAuth(phoneNo);
  }
}
