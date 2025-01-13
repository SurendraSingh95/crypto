import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Utils/utils.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool isValidLength = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool _obscureText = true;
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      _validatePassword(_passwordController.text);
    });
  }

  void _validatePassword(String password) {
    setState(() {
      isValidLength = password.length >= 8;
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildValidationRule(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_box : Icons.cancel,
          color: isValid ? CryptoColor.button : CryptoColor.textRed ,
          size: 18,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isValid ? CryptoColor.textNormal  :  CryptoColor.textNormal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        isValidLength && hasUppercase && hasNumber && hasSpecialCharacter;

    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar:CustomSimpleAppBar(title: "Reset Password"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextCenter(text: "Create a New Password", fontSize: 4,color:CryptoColor.textNormal ,),
            SizedBox(
              height: large * 0.04,
            ),
            CustomText(
              text: "Password",
              fontSize: 4,
              color: CryptoColor.textBold,
              fontWeight: FontWeight.normal,
            ),
            TextFormField(
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Enter Password",
                filled: true,
                fillColor: CryptoColor.textFormField,
                contentPadding: EdgeInsets.only(top: 13,left: 10),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off_outlined,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildValidationRule("Minimum of 8 characters", isValidLength),
            SizedBox(height: 8,),
            _buildValidationRule("At least one uppercase character", hasUppercase),
            SizedBox(height: 8,),
            _buildValidationRule("At least one number", hasNumber),
            SizedBox(height: 8,),
            _buildValidationRule(
                "At least one unique character (e.g. @\$%^&*)", hasSpecialCharacter),
            SizedBox(
              height: large * 0.09,
            ),
            Center(
              child: CustomButton(
                width: 250,
                text: "Reset Password",onPressed: isButtonEnabled
                  ? (){
                  Utils.mySnackBar(title: "Password Reset",msg: "Password reset successfully!");
              }  : null,
                color:  isButtonEnabled
                    ?CryptoColor.button
                    : CryptoColor.buttonVisible,
              ),
            )
            // Center(
            //   child: ElevatedButton(
            //     onPressed: isButtonEnabled
            //         ? () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Password reset successfully!")),
            //       );
            //     }
            //         : null, // Disable button if not valid
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: isButtonEnabled
            //           ?CryptoColor.button
            //           : CryptoColor.buttonVisible,
            //       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
            //     ),
            //     child: Text(
            //       "Reset Password",
            //       style: TextStyle(color: Colors.white, fontSize: 16),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
