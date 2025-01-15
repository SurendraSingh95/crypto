import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ServiceHistoryScreen extends StatefulWidget {
  const ServiceHistoryScreen({super.key});

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  String selectedStatus = "Successful";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomSimpleAppBar(title: "Transaction History"),
      backgroundColor: CryptoColor.white,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child:ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return _buildTransactionTile(
              "Data",
              "-₦10,000",
              "11:30 am",
              "12 Dec 2024",
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
        color: CryptoColor.white,
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
                      Image.asset('assets/Service/Frame 2296 (8).png',scale: 2,),
                      SizedBox(width: large*0.01,),
                      CustomText(text: title, fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),

                    ],
                  ),
                  InkWell(
                    onTap: (){

                    },
                      child: CustomText(text: amount, fontSize: 3,color: CryptoColor.textRed,fontWeight: FontWeight.bold,)),

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
