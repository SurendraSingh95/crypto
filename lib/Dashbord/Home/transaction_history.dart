import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
        child: Column(
          children: [
          Card(
            color: CryptoColor.textFormField,
          elevation: 0,
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Successful button
              Expanded(
                child: CustomButtonHistory(
                  text: "Successful",
                  onPressed: () {
                    setState(() {
                      selectedStatus = "Successful";
                    });
                  },
                  color: selectedStatus == "Successful" ?  CryptoColor.button : CryptoColor.textFormField, // Red if selected, else default
                ),
              ),
              // Pending button
              Expanded(
                child: CustomButtonHistory(
                  text: "Pending",
                  onPressed: () {
                    setState(() {
                      selectedStatus = "Pending";
                    });
                  },
                  color: selectedStatus == "Pending" ? CryptoColor.button : CryptoColor.textFormField, // Red if selected, else default
                ),
              ),
              // Failed button
              Expanded(
                child: CustomButtonHistory(
                  text: "Failed",

                  onPressed: () {
                    setState(() {
                      selectedStatus = "Failed";
                    });
                  },
                  color: selectedStatus == "Failed" ? CryptoColor.button : CryptoColor.textFormField, // Red if selected, else default
                ),
              ),
            ],
          ),
        ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _buildTransactionTile(
                      "Received ETH",
                      "+0.9893820 BTC",
                      "11:30 am",
                      "Coin from oluwatosin.eth");
                },
              ),
            ),
          ],
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
                      Image.asset('assets/home/send.png',scale: 1.5,),
                      SizedBox(width: large*0.01,),
                      CustomText(text: title, fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),

                    ],
                  ),
                  CustomText(text: amount, fontSize: 3,color: CryptoColor.textGreen,fontWeight: FontWeight.bold,),

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
