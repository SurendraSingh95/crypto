// Flutter imports:

import 'dart:async';

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



class PinScreen extends StatefulWidget {

  const PinScreen({super.key,});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  LoginController loginController = Get.put(LoginController());


  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

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

    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  /// Get next or previous field
  void nextField(String value, int index) {
    if (value.length == 1 && index < 3) {
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
      appBar: CustomSimpleAppBar(title: "Pin"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCenter(
                  text:
                  "Create 4 digits pin that you will\nbe using for your Transactions. ",
                  fontSize: 4,
                  color: CryptoColor.textNormal,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: large * 0.05  ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
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
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: large * 0.01,
                ),
                CustomTextCenter(text: "(keep this pin save and personal.\nDon’t share it with others.)", fontSize: 4,color: CryptoColor.textRed,),
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
                width: 280,
                text: 'Create Pin',
                onPressed: isButtonEnabled
                    ? () {
                  _showSuccessBottomSheet(context);

                }
                    : null, // Disable button if fields are not filled
                fontFamily: '',
              ),
            ),

            SizedBox(
              height: large * 0.02,
            ),

          ]
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
              CustomTextCenter(text: "You have successfully\nsigned up.", fontSize: 4,fontWeight: FontWeight.normal,color: CryptoColor.textNormal,),

              SizedBox(height: 20),
              Image.asset(
                'assets/images/email_verifivation.png',
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(text: 'Continue',onPressed: (){
                  Get.back();
                },),
              )
            ],
          ),
        );
      },
    );
  }

}

