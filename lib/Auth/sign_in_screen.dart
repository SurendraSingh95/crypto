import 'package:crepto/Auth/SignUp/sign_up_screen.dart';
import 'package:crepto/Auth/SignUp/signup_varification_screen.dart';
import 'package:crepto/Controllers/Auth%20Controllers/login_controller.dart';
import 'package:crepto/Controllers/Auth%20Controllers/registration_controller.dart';
import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Dashbord/dash_board_screen.dart';
import 'package:crepto/Utils/utils.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:crepto/constants/customTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'Forgot/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginController loginController = Get.put(LoginController());
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  bool _obscureText = true;
  bool isFormValid = false;
  bool _isChecked = false;


  @override
  void initState() {
    super.initState();
    loginController.passwordController.addListener(_checkFormValidity);
    loginController.emailController.addListener(_checkFormValidity);

  }



  @override
  void dispose() {

    loginController.emailController.removeListener(_checkFormValidity);
    loginController.passwordController.removeListener(_checkFormValidity);


    super.dispose();
  }

  _checkFormValidity() {
    setState(() {
      isFormValid = loginController.emailController.text.isNotEmpty &&
          loginController.passwordController.text.isNotEmpty &&
          _isValidEmail(loginController.emailController.text);
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: CryptoColor.white,
      appBar: const CustomSimpleAppBar(title: "Sign In",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: loginController.formKey,
          child: ListView(
            children: [
              CustomTextCenter(text: "Hi John 🖐️ welcome back !!!\n Login to continue.", fontSize: 5),
              SizedBox(
                height: large * 0.04,
              ),
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
                controller: loginController.emailController,
                textInputType: TextInputType.emailAddress,

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),


              SizedBox(
                height: large * 0.02,
              ),
               CustomText(
                text: "Password",
                fontSize: 4,
                color: CryptoColor.textBold,
                fontWeight: FontWeight.normal,
              ),
               SizedBox(

            child: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: "Enter Password",
                hintStyle: TextStyle(
                  color: CryptoColor.cardBox,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),

                fillColor: CryptoColor.textFormField,
                filled: true,
                counterText: "",
                isDense:true,
                contentPadding: EdgeInsets.only(top: 10,left: 10),
                border: InputBorder.none,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(8.0),
                //   // borderSide: BorderSide(
                //   //   color: borderColor ?? Colors.transparent, // Remove border color
                //   // ),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color:  Colors.transparent, // Remove border color
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 12,
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.red, // Set the default border color
                  ),
                ),
              ),
            ),
          ),
              SizedBox(
                height: large * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor: CryptoColor.button, // Set the color when the checkbox is selected
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrinks touch target size
                      ),
                     CustomText(text: "Remember me", fontSize: 4)
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>ForgotPasswordScreen());
                    },
                      child: CustomText(text: "Forget password?", fontSize: 4,)),
                ],
              ),

              SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: CustomButton(
                      width: 200,
                      text: "Login",
                      onPressed:  () {
                        if (loginController.formKey.currentState!.validate()) {

                          if (!_isChecked) {
                            Utils.mySnackBar(title: "Select Remember", msg: "please select remember.");
                          } else {
                            Get.to(() => DashboardScreen());
                          }
                        } else {
                          Utils.mySnackBar(title: "Invalid Form", msg: "Please fill all the fields correctly.");
                        }
                      }
                    ),
                  ),


                  SizedBox(width: 10,),
                  Container(
                    height: 46,width: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CryptoColor.button)
                    ),
                    child: Image.asset("assets/images/finger.png",height: 50,width: 50,),
                  ),
                ],
              ),

              SizedBox(height: 10),
              SizedBox(
                height: large * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Don’t have an account ?',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                      children: [
                        TextSpan(
                          text: ' Sign up',
                          style: TextStyle(color: CryptoColor.button, fontSize: 12,fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                             Get.to(()=>SignUpScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    )
    );
  }

}
