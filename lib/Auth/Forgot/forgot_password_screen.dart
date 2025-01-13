// Flutter imports:

import 'package:crepto/Controllers/Auth%20Controllers/login_controller.dart';
import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Utils/utils.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:crepto/constants/customTextFormField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

import 'forgot_verification_screen.dart';

// Project imports:



class ForgotPasswordScreen extends StatefulWidget {


  const ForgotPasswordScreen({super.key,});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  LoginController loginController = Get.put(LoginController());

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
  }


  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar: CustomSimpleAppBar(title: "Forgot Password"),
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextCenter(
                text: "Enter your email, a code will be\nsent to you.",
                fontSize: 4,
                color: CryptoColor.textNormal,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: large * 0.03),
              Image.asset('assets/images/forgot.png'),
              SizedBox(height: large * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Email",
                      fontSize: 4,
                      color: CryptoColor.textBold,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomTextFormField(
                      isDense: false,
                      filled: true,
                      hintText: "Enter Email Address",
                      controller: loginController.forgetEmailController,
                      textInputType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Email is required';
                        } else if (!_isValidEmail(val)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: large * 0.09),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: CustomButton(
                    width: 250,
                    text: "Send",
                    onPressed:  () {
                      if (loginController.formKey.currentState!.validate()) {
                          Get.to(() => ForgotVerificationScreen(email: loginController.forgetEmailController.text,otp: 123456,));
        
                      }
                    }
                ),
              ),
        
              SizedBox(height: large * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}


