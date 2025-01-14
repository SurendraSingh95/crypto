import 'package:crepto/Auth/sign_in_screen.dart';
import 'package:crepto/Auth/SignUp/sign_up_screen.dart';
import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CryptoColor.white,
        body: Column(
          children: [
            // Stack(
            //   children: [
            //     Image.asset("assets/images/backGraound.png"),
            //     Positioned(
            //       top: 50,
            //       left: 0,
            //       bottom: -20,
            //       right: 0,
            //
            //       child: Image.asset("assets/images/onboding_last.png"),
            //     ),
            //   ],
            // ),
            Image.asset("assets/images/onboding_last.png"),
      
            SizedBox(height: 20,),
            CustomTextCenter(text: "Enjoy Seamless Crypto Trading,\n& Bill Payment Services\n Anytime, Anywhere & Any day.", fontSize: 5,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                height: 50,
                width: 280,
                text: "Create An Account", onPressed: (){
                 Get.to(()=>SignUpScreen());
              }, ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomOutLine(
                height: 50,
                width: 280,
                text: "Login", onPressed: (){
                Get.to(()=>SignInScreen());
              }, ),
            ),
      
          ],
        ),
      ),
    );
  }
}
