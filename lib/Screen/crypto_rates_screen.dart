import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';



class CryptoCardRatesScreen extends StatefulWidget {
  const CryptoCardRatesScreen({super.key});

  @override
  _CryptoCardRatesScreenState createState() => _CryptoCardRatesScreenState();
}

class _CryptoCardRatesScreenState extends State<CryptoCardRatesScreen> {



  String receiptType = '';
  String cardValue = '';
  double rate = 0.0;
  double btcValue = 0.0;
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;


  String? selectedGiftCard;
  final List<Map<String, String>> giftCards = [
    {'id': '1', 'name': 'BTC',},
    {'id': '2', 'name': 'USDT (TRC20)',},
    {'id': '3', 'name': 'USDT (ERC20)',},
    {'id': '4', 'name': 'BTC (ERC20)',},

  ];


  String? selectedCountry;
  final List<Map<String, String>> countries = [
    {'id': '1', 'name': 'Buy',},
    {'id': '2', 'name': 'Sell',},


  ];
  void calculateRate() {
    setState(() {
      rate = cardValue.isNotEmpty ? double.parse(cardValue) * 1730 : 0.0;
      btcValue = rate / 5000000; // Example BTC conversion
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = selectedGiftCard != null && selectedCountry != null;

    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar: CustomSimpleAppBar(title: "Crypto Rates"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextCenter(text: "This is an estimated rate, and it might differ\nslightly from the actual rate..", fontSize: 4),
            SizedBox(height: large * 0.01),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: Container(
                width: double.infinity, // Makes the card full width
                padding: EdgeInsets.all(16), // Add some padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: CryptoColor.textNormal.withOpacity(0.2)),
                          ),
                          child: CustomTextCenter(text: "\$1 = ₦1730", fontSize: 4),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    CustomTextCenter(
                      text: "NGN${rate.toStringAsFixed(2)}",
                      fontSize: 5,
                      fontWeight: FontWeight.bold,
                      color: CryptoColor.textBold,
                    ),
                    CustomTextCenter(
                      text: "${btcValue.toStringAsFixed(8)} BTC",
                      fontSize: 4,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomText(text: "Crypto Wallet", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  hint: CustomText(
                    text: "Select Crypto Wallet",
                    fontSize: 4,
                    color: CryptoColor.cardBox,
                    fontWeight: FontWeight.normal,
                  ),
                  value: selectedGiftCard,
                  items: giftCards.map((giftcard) {
                    return DropdownMenuItem(
                      value: giftcard['id'],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: selectedGiftCard == null
                                ? CryptoColor.cardBox.withOpacity(0.4) // Border only when dropdown is expanded
                                : Colors.transparent, // No border when item is selected
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(text: giftcard['name']!, fontSize: 3.5),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGiftCard = value;
                    });
                  },
                  icon: Icon(
                    selectedGiftCard == null ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                    color: CryptoColor.textNormal,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            CustomText(text: "Wallet Action", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  hint: CustomText(
                    text: " Select Wallet Action",
                    fontSize: 4,
                    color: CryptoColor.cardBox,
                    fontWeight: FontWeight.normal,
                  ),
                  value: selectedCountry,
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country['id'],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: selectedCountry == null
                                ? CryptoColor.cardBox.withOpacity(0.4) // Border only when dropdown is expanded
                                : Colors.transparent, // No border when item is selected
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(text: country['name']!, fontSize: 3.5),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  icon: Icon(
                    selectedCountry == null ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                    color: CryptoColor.textNormal,
                  ),
                ),
              ),
            ),



            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                text: "Check Rate",
                onPressed: isButtonEnabled ? () {

                } : null,
                color: isButtonEnabled ? CryptoColor.button : CryptoColor.buttonVisible,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
