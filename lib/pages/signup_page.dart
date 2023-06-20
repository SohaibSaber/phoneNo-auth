import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firbase/auth-repo/auth_repository.dart';
import 'package:phone_auth_firbase/controller/signup_controller.dart';
import 'package:phone_auth_firbase/pages/otp.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.phoneNo,
                          decoration: const InputDecoration(
                              label: Text("Phone Number"),
                              prefixIcon: Icon(Icons.numbers),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black
                                  )
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()){
                                  SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                                  Get.to(()=> const OtpScreen());
                                }
                              },
                              child:
                              const Text('Sign Up')),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
