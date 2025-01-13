// Flutter imports:

import 'dart:async';

import 'package:crepto/Auth/Forgot/pin_screen.dart';
import 'package:crepto/Controllers/Auth%20Controllers/login_controller.dart';
import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Utils/utils.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:



class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final int? otp;

  const EmailVerificationScreen({super.key, required this.otp, required this.email});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  LoginController loginController = Get.put(LoginController());
  int _resendCodeTimer = 60; // 60 seconds timer
  Timer? _timer; // Timer object
  bool _isResendDisabled = false; // Track button state

  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  bool isButtonEnabled = false; // State to track if button should be enabled

  /// Check if all TextFields are filled
  void checkIfAllFieldsFilled() {
    bool allFilled = _controllers.every((controller) => controller.text.isNotEmpty);
    setState(() {
      isButtonEnabled = allFilled;
    });
  }
  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
  void _startResendCodeTimer() {
    setState(() {
      _isResendDisabled = true;
      _resendCodeTimer = 60; // Reset the timer
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCodeTimer > 0) {
          _resendCodeTimer--;
        } else {
          _isResendDisabled = false;
          timer.cancel(); // Stop the timer
        }
      });
    });
  }


  /// Get next or previous field
  void nextField(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
    checkIfAllFieldsFilled(); // Check fields whenever the user types
  }

  /// Get OTP from all controllers
  String getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar: CustomSimpleAppBar(title: "Email Verification"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCenter(
                  text:
                  "Enter the 6 digit number sent to ",
                  fontSize: 4,
                  color: CryptoColor.textNormal,
                  fontWeight: FontWeight.normal,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextCenter(
                      text:
                      widget.email,
                      fontSize: 4,
                      color: CryptoColor.button,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(width: 5,),
                    CustomTextCenter(
                      text:
                      "for verification",
                      fontSize: 4,
                      color: CryptoColor.textNormal,
                      fontWeight: FontWeight.normal,
                    ),

                  ],
                ),
                CustomTextCenter(
                  text:
                  "OTP: ${widget.otp}",
                  fontSize: 4,
                  color: CryptoColor.textNormal,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: large * 0.01  ,
                ),
                SizedBox(
                  height: large * 0.05  ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: large * 0.05,
                      height: large * 0.05,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: CryptoColor.textBold,
                        ),
                        decoration: InputDecoration(
                          fillColor: CryptoColor.textFormField,
                          filled: true,
                          contentPadding: const EdgeInsets.only(bottom: 5),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: CryptoColor.boxOTP),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: CryptoColor.button),
                          ),
                        ),
                        onChanged: (value) => nextField(value, index),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: large * 0.03,
                ),
              ],
            ),
            SizedBox(
              height: large * 0.073,
            ),
            Center(
              child: CustomButton(
                width: 300,
                text: 'Verify',
                onPressed: isButtonEnabled
                    ? () {
                  String otp = getOtp();
                  if (otp == widget.otp.toString()) {

                    _showSuccessBottomSheet(context);
                  } else {
                    Utils.mySnackBar(
                      title: "Wrong OTP",
                      msg: "The OTP you entered is incorrect",
                    );
                  }
                }
                    : null, // Disable button if fields are not filled
                fontFamily: '',
              ),
            ),

            SizedBox(
              height: large * 0.02,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Didn’t Receive Code?",
                  style: TextStyle(
                    color: CryptoColor.textBold,
                    fontSize: Constants.getResponsiveFontSize(3.5),
                    fontWeight: FontWeight.normal,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: _isResendDisabled
                          ? " Resend in $_resendCodeTimer s" // Show timer countdown
                          : " Resend Code",
                      style: TextStyle(
                        color: _isResendDisabled ?CryptoColor.button : CryptoColor.button,
                        fontSize: Constants.getResponsiveFontSize(4.0),
                        fontWeight: FontWeight.normal,
                      ),
                      recognizer: _isResendDisabled
                          ? null // Disable tap during the timer
                          : (TapGestureRecognizer()
                        ..onTap = () {
                          // Trigger the resend code API or function
                          // loginController.verifyForgotMobile();
                          _startResendCodeTimer(); // Start the timer
                        }),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CryptoColor.textFormField,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/email_veriy.png',
              ),
              SizedBox(height: large*0.03 ),
              CustomTextCenter(text: "Successful", fontSize: 5,fontWeight: FontWeight.bold,color: CryptoColor.textBold,),
              SizedBox(height: 8),
              CustomTextCenter(text: "Your email has been\nsuccessfully verified.", fontSize: 4,fontWeight: FontWeight.normal,color: CryptoColor.textNormal,),

              SizedBox(height: 20),
              Image.asset(
                'assets/images/email_verifivation.png',
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(text: 'Continue',onPressed: (){
                 Get.to(()=>PinScreen());
                },),
              )
            ],
          ),
        );
      },
    );
  }

}

