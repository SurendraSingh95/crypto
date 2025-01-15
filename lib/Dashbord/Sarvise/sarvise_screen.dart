import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/Dashbord/Sarvise/service_history_screen.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SarviseScreen extends StatefulWidget {
  const SarviseScreen({Key? key}) : super(key: key);

  @override
  State<SarviseScreen> createState() => _SarviseScreenState();
}

class _SarviseScreenState extends State<SarviseScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: CryptoColor.white,
      body: Column(
        children: [
          SizedBox(height: large*0.02,),
            Image.asset('assets/Service/card.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
              child: Column(
                children: [

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'All Services', fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),
                    InkWell(
                      onTap: (){
                        Get.to(()=>ServiceHistoryScreen());
                      },
                        child: CustomText(text: 'Service History', fontSize: 4,color: CryptoColor.button,fontWeight: FontWeight.normal,)),
                  ],
                            ),
                  SizedBox(height: large*0.02),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (5).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Giftcard', fontSize: 4)
                              ],
                            ),
                            SizedBox(height: large*0.02,),
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (9).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Betting', fontSize: 4)
                              ],
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (6).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Electricity', fontSize: 4)
                              ],
                            ),
                            SizedBox(height: large*0.02,),
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (10).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Internet', fontSize: 4)
                              ],
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (7).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Airtime', fontSize: 4)
                              ],
                            ),
                            SizedBox(height: large*0.02,),
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (11).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Cable TV', fontSize: 4)
                              ],
                            )

                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/Service/Frame 2296 (8).png'),
                                SizedBox(height: 3,),
                                CustomText(text: 'Data', fontSize: 4)
                              ],
                            ),
                          ],
                        ),




                      ],
                    ),
                  ),
                  SizedBox(height: large*0.02),




                ],
              ),
            ),
        ],
      ),
    );
  }
}
