import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'get_wallet_history.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  String selectedStatus = "Successful";
  bool _isBalanceVisible = true;

  bool _isImagesVisible = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CryptoColor.white,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child:Column(
          children: [
            Card(
              color: CryptoColor.textFormField,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Available Balance NGN",
                              fontSize: 5,
                              fontWeight: FontWeight.normal,
                              color: CryptoColor.textNormal,
                            ),
                            SizedBox(width: 8),
                            Image.asset('assets/home/naira.png'),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isBalanceVisible = !_isBalanceVisible; // Toggle visibility
                                });
                              },
                              child: Image.asset(
                                _isBalanceVisible
                                    ? 'assets/home/eye_closs.png' // Image for visible state
                                    : 'assets/home/eye.png', // Image for hidden state
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isImagesVisible = !_isImagesVisible; // Toggle image visibility
                                });
                              },
                              child: Image.asset('assets/home/drop.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: _isBalanceVisible
                                  ? "₦100,250.00"
                                  : "₦********",
                              fontSize: 5,
                              fontWeight: FontWeight.bold,
                              color: CryptoColor.textBold,
                            ),
                            CustomText(
                              text: "0.0000 USD",
                              fontSize: 4,
                              fontWeight: FontWeight.normal,
                              color: CryptoColor.textNormal,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: _isImagesVisible
                              ? [
                           InkWell(
                             onTap: (){
                               Get.to(()=>WalletHistoryScreen());
                             },
                               child: CustomText(text: "Transaction History", fontSize: 3,color: CryptoColor.button,))
                          ]
                              : [],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButtonHistory(
                height: 50,
                  text: "Add Funds"),
            ),
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildTransactionTile(
                    "BNB",
                    "0.00067524",
                    "BNB",
                    "0.00000344 BTC",
                    "Today’s PNL",
                    "-${formatCurrency(0.01)}(-2.32%)", // Example of formatting PNL as currency
                    "Average Cost",
                    formatCurrency(126.54), // Example of formatting cost as currency
                  );
                },
              ),
            )


          ],
        ),

      ),
    );
  }
  String formatCurrency(double amount) {
    return NumberFormat.simpleCurrency().format(amount); // This will format it as currency (e.g., $0.01)
  }
  Widget _buildTransactionTile(
      String title,String title1,String title2,String title3,String title4, String title5, String title6, String title7,) {
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
                      Image.asset('assets/Service/wallet.png',scale: 1,),
                      SizedBox(width: large*0.01,),
                      CustomText(text: title, fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),

                    ],
                  ),
                  InkWell(
                    onTap: (){
                   
                    },
                      child: CustomText(text: title1, fontSize: 3,color: CryptoColor.textBold,fontWeight: FontWeight.bold,)),

                ],
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: title2, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                    CustomText(text: title3, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),

                  ],
                ),
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: title4, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                    CustomText(text: title5, fontSize: 3,color: CryptoColor.textRed,fontWeight: FontWeight.normal,),

                  ],
                ),
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: title6, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                    CustomText(text: title7, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),

                  ],
                ),
              ),
            ],
          ),
        )


    );
  }


}
