import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firbase/controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text('Code Verification',textAlign: TextAlign.center ,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),),
              const SizedBox(
                height: 40
              ),
              const Text('Enter the verification code sent at:',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code){
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: Text('Next'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
