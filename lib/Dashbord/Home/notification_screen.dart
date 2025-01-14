import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  String selectedStatus = "Successful";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomSimpleAppBar(title: "Notifications"),
      backgroundColor: CryptoColor.white,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child:ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            String amount = "\$400";
            return _buildTransactionTile(
              "A payment of $amount was ",
              "08.10 am",
              "12 Dec, 2024",
              "made by Stephen Charles",
            );
          },
        ),

      ),
    );
  }
  Widget _buildTransactionTile(
      String title, String amount, String time, String subtitle) {
    return Card(
        elevation: 0,
        color: CryptoColor.textFormField,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(

                color: CryptoColor.cardOutline

            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/notification_man.png',scale: 1,),
                      SizedBox(width: large*0.01,),
                      CustomText(text: title, fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),

                    ],
                  ),
                  CustomText(text: amount, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.bold,),

                ],
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: subtitle, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                    CustomText(text: time, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),

                  ],
                ),
              ),
            ],
          ),
        )


    );
  }
}
