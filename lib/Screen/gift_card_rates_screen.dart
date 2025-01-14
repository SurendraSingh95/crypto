import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';



class GiftCardRatesScreen extends StatefulWidget {
  const GiftCardRatesScreen({super.key});

  @override
  _GiftCardRatesScreenState createState() => _GiftCardRatesScreenState();
}

class _GiftCardRatesScreenState extends State<GiftCardRatesScreen> {



  String receiptType = '';
  String cardValue = '';
  double rate = 0.0;
  double btcValue = 0.0;
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;


  String? selectedGiftCard;
  final List<Map<String, String>> giftCards = [
    {'id': '1', 'name': 'Airbnb US', 'image': 'assets/images/Airbnb 1.png'},
    {'id': '2', 'name': 'App Stores & iTunes US', 'image': 'assets/images/Frame 238298.png'},
    {'id': '3', 'name': 'Airbnb US', 'image': 'assets/images/Airbnb 1.png'},
    {'id': '4', 'name': 'App Stores & iTunes US', 'image': 'assets/images/Frame 238298.png'},

  ];


  String? selectedCountry;
  final List<Map<String, String>> countries = [
    {'id': '1', 'name': 'Argentina', 'image': 'assets/images/Flag-Argentina 1.png'},
    {'id': '2', 'name': 'Angola', 'image': 'assets/images/Flag_of_Angola 1.png'},
    {'id': '3', 'name': 'Argentina', 'image': 'assets/images/Flag-Argentina 1.png'},
    {'id': '4', 'name': 'Angola', 'image': 'assets/images/Flag_of_Angola 1.png'},

  ];
  void calculateRate() {
    setState(() {
      rate = cardValue.isNotEmpty ? double.parse(cardValue) * 1730 : 0.0;
      btcValue = rate / 5000000; // Example BTC conversion
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = selectedGiftCard != null && selectedCountry != null && receiptType != null && cardValue.isNotEmpty;

    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar: CustomSimpleAppBar(title: "Giftcard Rates"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextCenter(text: "This is an estimated rate, and it might differ\nslightly from the actual rate.", fontSize: 4),
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
            CustomText(text: "Select GiftCard", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: CustomText(
                    text: "Select GiftCard",
                    fontSize: 4,
                    color: CryptoColor.cardBox,
                    fontWeight: FontWeight.normal,
                  ),
                  value: selectedGiftCard,
                  items: giftCards.map((giftcard) {
                    return DropdownMenuItem(
                      value: giftcard['id'],
                      child: Row(
                        children: [
                          Image.asset(
                            giftcard['image']!,
                            width: 40,
                            height: 60,
                          ),
                          SizedBox(width: 8),
                          CustomText(text: giftcard['name']!, fontSize: 3.5),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGiftCard = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomText(text: "Select Country", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: CustomText(
                    text: "Select Country",
                    fontSize: 4,
                    color: CryptoColor.cardBox,
                    fontWeight: FontWeight.normal,
                  ),
                  value: selectedCountry,
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country['id'],
                      child: Row(
                        children: [
                          Image.asset(
                            country['image']!,
                            width: 30,
                            height: 50,
                          ),
                          SizedBox(width: 8),
                          CustomText(text: country['name']!, fontSize: 3.5),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomText(text: "Receipt Availability", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Physical'),
                    value: 'Physical',
                    groupValue: receiptType,
                    onChanged: (value) {
                      setState(() {
                        receiptType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('E-Code'),
                    value: 'E-Code',
                    groupValue: receiptType,
                    onChanged: (value) {
                      setState(() {
                        receiptType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomText(text: "Card Value (\$)", fontSize: 4, color: CryptoColor.textBold, fontWeight: FontWeight.normal),
            Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5),
                  border: InputBorder.none,
                  hintText: 'Card Value (\$)',
                  hintStyle: TextStyle(color: CryptoColor.cardBox),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    cardValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
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
