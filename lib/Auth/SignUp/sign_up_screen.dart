import 'package:crepto/Controllers/Auth%20Controllers/registration_controller.dart';
import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Utils/utils.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:crepto/constants/customTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'email_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RegistrationController registrationController = Get.put(RegistrationController());
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  bool _obscureText = true;
  bool _isChecked = false;
  bool isFormValid = false; // To track if the form is valid

  @override
  void initState() {
    super.initState();

    // Add listeners to text controllers
    registrationController.firstNameController.addListener(_checkFormValidity);
    registrationController.lastNameController.addListener(_checkFormValidity);
    registrationController.emailController.addListener(_checkFormValidity);
    registrationController.userNameController.addListener(_checkFormValidity);
    registrationController.phoneController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    // Dispose controllers and remove listeners
    registrationController.firstNameController.removeListener(_checkFormValidity);
    registrationController.lastNameController.removeListener(_checkFormValidity);
    registrationController.emailController.removeListener(_checkFormValidity);
    registrationController.userNameController.removeListener(_checkFormValidity);
    registrationController.phoneController.removeListener(_checkFormValidity);

    super.dispose();
  }

   _checkFormValidity() {
    setState(() {
          isFormValid = registrationController.firstNameController.text.isNotEmpty &&
          registrationController.lastNameController.text.isNotEmpty &&
          registrationController.emailController.text.isNotEmpty &&
          registrationController.userNameController.text.isNotEmpty &&
          registrationController.phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: CryptoColor.white,
      appBar: const CustomSimpleAppBar(title: "Sign Up",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: registrationController.formKey,
          child: ListView(
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         CustomText(
                          text: "First Name",
                          fontSize: 4,
                          color: CryptoColor.textBold,
                          fontWeight: FontWeight.normal),

                         CustomTextFormField(
                          isDense: false,
                          filled: true,
                          hintText: "Enter First Name",

                          controller: registrationController.firstNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                                   ),
                       ],
                     ),
                   ),
                   SizedBox(
                     width: large * 0.01,
                   ),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         CustomText(
                          text: "Last Name",
                          fontSize: 4,
                          color: CryptoColor.textBold,
                          fontWeight: FontWeight.normal,
                                   ),

                         CustomTextFormField(
                          isDense: false,
                          filled: true,
                          hintText: "Enter Last Name",
                          controller: registrationController.lastNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                                   ),
                       ],
                     ),
                   ),
                 ],
               ),
              SizedBox(
                height: large * 0.02,
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
                controller: registrationController.emailController,
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
                text: "Username",
                fontSize: 4,
                color: CryptoColor.textBold,
                fontWeight: FontWeight.normal,
              ),
              CustomTextFormField(
                isDense: false,
                filled: true,
                hintText: "Enter Username",
                controller: registrationController.userNameController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: large * 0.02,
              ),
              CustomText(
                text: "Phone Number",
                fontSize: 4,
                color: CryptoColor.textBold,
                fontWeight: FontWeight.normal,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CryptoColor.textFormField,
                ),
                child: InternationalPhoneNumberInput(
                  cursorColor: Colors.grey,
                  onInputChanged: (PhoneNumber number) {
                    setState(() {
                      registrationController.number = number;
                    });
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    showFlags: true,
                    useEmoji: true,
                  ),
                  inputDecoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(
                      color: CryptoColor.cardBox,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    counterText: "",
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    alignLabelWithHint: true,
                  ),
                  initialValue: registrationController.number,
                  textFieldController: registrationController.phoneController,
                  formatInput: false,
                ),
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
              CustomText(
                text: "Referral (Optional)",
                fontSize: 4,
                color: CryptoColor.textBold,
                fontWeight: FontWeight.normal,
              ),

              CustomTextFormField(
                isDense: false,
                filled: true,
                hintText: "Referral (Optional)",
                controller: registrationController.lastNameController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: CryptoColor.button, fontSize: 12),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Privacy Policy link action
                              },
                          ),
                          TextSpan(
                            text: ' and acknowledge user ',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          TextSpan(
                            text: '\n', // Newline character for next line
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(color: CryptoColor.button, fontSize: 13),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Terms & Conditions link action
                              },
                          ),
                          TextSpan(
                            text: ' of Swerf.',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: large * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  text: "Create An Account",
                  onPressed: isFormValid ? () {
                    if (registrationController.formKey.currentState!.validate()) {

                      if (!_isChecked) {
                        Utils.mySnackBar(title: "Please select", msg: "I agree to the terms and conditions.");
                      } else {
                        Get.to(() => EmailVerificationScreen(email: registrationController.emailController.text,otp: 123456,));
                      }
                    } else {
                      Utils.mySnackBar(title: "Invalid Form", msg: "Please fill all the fields correctly.");
                    }
                  } : null, // Disable button if form is not valid
                ),
              ),



              SizedBox(height: 20),
              SizedBox(
                height: large * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account ?',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                      children: [
                        TextSpan(
                          text: ' Sign in',
                          style: TextStyle(color: CryptoColor.button, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Privacy Policy link action
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
  void _validateForm() {
    setState(() {
      isFormValid = registrationController.formKey.currentState?.validate() ?? false;
    });
  }
}
