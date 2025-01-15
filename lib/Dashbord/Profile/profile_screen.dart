import 'package:crepto/Controllers/change_themes_controller.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var themeController = Get.find<ThemeController>();
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ?  CryptoColor.textNormal : CryptoColor.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/profile/profile (32) 1.png",scale: 1.2,),
                        SizedBox(width: large*0.01,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: 'John Doe', fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),
                            CustomText(text: 'example@gmail.com', fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                            CustomText(text: 'Tier 1', fontSize: 3,color: CryptoColor.textGreen,fontWeight: FontWeight.normal,),
          
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                        CustomText(text: 'Edit', fontSize: 3,color: CryptoColor.button,fontWeight: FontWeight.bold,),
                        Image.asset("assets/profile/edit-2.png"),
          
                      ],),
                    )
                  ],
                ),
              ),
            ),
              SizedBox(height: large*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CustomText(text: 'Account', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
              ),
              Card(
              elevation: 0,
              color: CryptoColor.profileCard,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
          
                        Image.asset("assets/profile/bank.png"),
                        SizedBox(width: large*0.01,),
                        CustomText(text: 'Bank Account', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                      ],
                    ),
                    SizedBox(height: large*0.02,),
                    Row(
                      children: [
          
                        Image.asset("assets/profile/21. Verified.png"),
                        SizedBox(width: large*0.01,),
                        CustomText(text: 'KYC Verification', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                      ],
                    ),
                    SizedBox(height: large*0.02,),
                    Row(
                      children: [
          
                        Image.asset("assets/profile/marchent_pro.png"),
                        SizedBox(width: large*0.01,),
                        CustomText(text: 'Merchant Profile', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                      ],
                    ),
          
                    SizedBox(height: large*0.02,),
                    Row(
                      children: [
          
                        Image.asset("assets/profile/account_icon 1.png"),
                        SizedBox(width: large*0.01,),
                        CustomText(text: 'Account Limit', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                      ],
                    ),
          
          
                  ],
                ),
              ),
            ),
          
              SizedBox(height: large*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CustomText(text: 'Security', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
              ),
              Card(
                elevation: 0,
                color: CryptoColor.profileCard,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
          
                          Image.asset("assets/profile/bank.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: '2FA Authentication', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/21. Verified.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Security Question', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/marchent_pro.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Change Password', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
          
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/account_icon 1.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Change Pin', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
          
          
                    ],
                  ),
                ),
              ),
          
              SizedBox(height: large*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CustomText(text: 'System Preference', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
              ),
              Card(
                elevation: 0,
                color: CryptoColor.profileCard,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
          
                          Image.asset("assets/profile/bank.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Dark Mode', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                          Switch(
                          value: themeController.isDarkMode.value,
                            onChanged: (value) {
                            setState(() {

                            });
                              themeController.toggleTheme();
                            },
                          )
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/21. Verified.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Notification', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/marchent_pro.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Touch ID / Face ID', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
          
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [
          
                          Image.asset("assets/profile/account_icon 1.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Refer and Earn', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
          
          
                    ],
                  ),
                ),
              ),

              SizedBox(height: large*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CustomText(text: 'System Preference', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
              ),
              Card(
                elevation: 0,
                color: CryptoColor.profileCard,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Image.asset("assets/profile/bank.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Contact Support', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [

                          Image.asset("assets/profile/21. Verified.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Terms & Conditions', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),
                      SizedBox(height: large*0.02,),
                      Row(
                        children: [

                          Image.asset("assets/profile/marchent_pro.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Deactivate Account', fontSize: 3.5,color: CryptoColor.textRed,fontWeight: FontWeight.normal,),
                        ],
                      ),

                      SizedBox(height: large*0.02,),
                      Row(
                        children: [

                          Image.asset("assets/profile/account_icon 1.png"),
                          SizedBox(width: large*0.01,),
                          CustomText(text: 'Log Out', fontSize: 3.5,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
