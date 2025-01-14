import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Screen/crypto_rates_screen.dart';
import 'package:crepto/Screen/gift_card_rates_screen.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'transaction_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                // Allows the positioned widget to overflow
                children: [
                  // Top Card
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
                                      text: 'Available Balance NGN',
                                      fontSize: 4),
                                  SizedBox(width: 8),
                                  Image.asset('assets/home/naira.png'),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/home/eye.png'),
                                  SizedBox(width: 8),
                                  Image.asset('assets/home/drop.png'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: '₦********', fontSize: 6),
                              Image.asset('assets/home/Open eyes.png'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: '0.0000 USD', fontSize: 4),
                              Image.asset(
                                'assets/home/pngwing.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Card
                  Positioned(
                    top: 122, // Adjust this value to control overlap
                    left: 0,
                    right: 0,
                    child: Card(
                      color: CryptoColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      // Add horizontal margin for alignment
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildActionButton('assets/home/send.png', 'Send'),
                            _buildActionButton(
                                'assets/home/recive.png', 'Receive'),
                            _buildActionButton(
                                'assets/home/buy.png', 'Buy & Sell'),
                            _buildActionButton('assets/home/swap.png', 'Swap'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: large * 0.1),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/home/card.png',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),

                  // Content over the image
                  Positioned(
                    top: 10,
                    // Adjust this to position the content lower or higher
                    left: 10,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Our Rates",
                            fontSize: 5,
                            fontWeight: FontWeight.bold,
                            color: CryptoColor.textBold,
                          ),
                          CustomText(
                            text:
                                "Click on the buttons below to check out our current rates",
                            fontSize: 3.5,
                            fontWeight: FontWeight.normal,
                            color: CryptoColor.textNormal,
                          ),
                          SizedBox(height: large * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Get.to(() => CryptoCardRatesScreen());
                                },
                                child: Container(
                                  height: 47,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CryptoColor.button),
                                  child: CustomTextCenter(
                                    text: "Crypto",
                                    fontSize: 4,
                                    color: CryptoColor.white,
                                  ),
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: CustomLine(
                                  text: "Giftcards",
                                  onPressed: () {
                                    Get.to(() => GiftCardRatesScreen());
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              // Recent Transactions
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Recent Transactions",
                      fontSize: 4.5,
                      color: CryptoColor.textBold,
                      fontWeight: FontWeight.bold,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => TransactionHistory());
                        },
                        child: CustomText(
                          text: "See All",
                          fontSize: 4.0,
                          color: CryptoColor.button,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 5),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5, // Example transaction count
                itemBuilder: (context, index) {
                  return _buildTransactionTile("Received ETH", "+0.9893820 BTC",
                      "11:30 am", "Coin from oluwatosin.eth");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(imagePath),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildTransactionTile(
      String title, String amount, String time, String subtitle) {
    return Card(
        elevation: 0,
        color: CryptoColor.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: CryptoColor.cardOutline)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/home/send.png',
                        scale: 1.5,
                      ),
                      SizedBox(
                        width: large * 0.01,
                      ),
                      CustomText(
                        text: title,
                        fontSize: 4,
                        color: CryptoColor.textBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  CustomText(
                    text: amount,
                    fontSize: 3,
                    color: CryptoColor.textGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: subtitle,
                      fontSize: 3,
                      color: CryptoColor.textNormal,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      text: time,
                      fontSize: 3,
                      color: CryptoColor.textNormal,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
