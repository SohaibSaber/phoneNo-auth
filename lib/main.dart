import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firbase/pages/dashboard.dart';
import 'package:phone_auth_firbase/pages/otp.dart';
import 'package:phone_auth_firbase/pages/signup_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      home: SignUpPage(),
    );
  }
}

