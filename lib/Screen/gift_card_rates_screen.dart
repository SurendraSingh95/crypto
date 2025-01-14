import 'dart:async';
import 'dart:convert';

import 'package:crepto/Customs/CustomButton.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';


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
  List<Map<String, String>> countries = [];
  String? selectedCountry;

  // Fetch all countries from the API


  Future<void> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name,flags'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        List<dynamic> countryList = json.decode(response.body);
        setState(() {
          countries = countryList.map((country) {
            return {
              'id': (country['ccn3']?.toString() ?? ''),
              'name': (country['name']['common'] ?? '') as String,
              'image': (country['flags']['png'] ?? '') as String,
            };
          }).toList();
        });
      } else {
        // Handle error
        print("Failed to load countries");
      }
    } on TimeoutException {
      print("Request timed out, retrying...");
      fetchCountries();  // Retry logic
    } catch (e) {
      // Handle any other exceptions
      print("Error occurred while fetching countries: $e");
    }
  }




  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  String? selectedGiftCard;
  final List<Map<String, String>> giftCards = [
    {'id': '1', 'name': 'Airbnb US', 'image': 'assets/images/Airbnb 1.png'},
    {'id': '2', 'name': 'App Stores & iTunes US', 'image': 'assets/images/Frame 238298.png'},
    {'id': '3', 'name': 'Airbnb US', 'image': 'assets/images/Airbnb 1.png'},
    {'id': '4', 'name': 'App Stores & iTunes US', 'image': 'assets/images/Frame 238298.png'},

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

        // countries.isEmpty
        //     ? Center(child: CupertinoActivityIndicator())  // Show a loading indicator while fetching
        //     : Card(
        //   elevation: 0,
        //   color: CryptoColor.textFormField,
        //   child: DropdownButtonHideUnderline(
        //     child: DropdownButton2<String>(
        //       isExpanded: true,
        //       hint: CustomText(
        //         text: "Select Country",
        //         fontSize: 4,
        //         color: CryptoColor.cardBox,
        //         fontWeight: FontWeight.normal,
        //       ),
        //       value: selectedCountry,
        //       items: countries.map((country) {
        //         return DropdownMenuItem(
        //           value: country['name'],
        //           child: Row(
        //             children: [
        //               // Display the flag image
        //               Image.network(
        //                 country['image']!,
        //                 width: 30,
        //                 height: 50,
        //               ),
        //               SizedBox(width: 8),
        //               // Display the country name
        //               CustomText(text: country['name']!, fontSize: 3.5),
        //             ],
        //           ),
        //         );
        //       }).toList(),
        //       onChanged: (value) {
        //         setState(() {
        //           selectedCountry = value;
        //         });
        //       },
        //     ),
        //   ),
        // ),
            countries.isEmpty
                ? Center(child: CupertinoActivityIndicator()) // Show a loading indicator while fetching
                : Card(
              elevation: 0,
              color: CryptoColor.textFormField,
              child: DropdownSearch<Map<String, String>>(
                dropdownBuilder: (context, selectedItem) {
                  return selectedItem == null
                      ? CustomText(
                    text: "Select Country",
                    fontSize: 4,
                    color: CryptoColor.cardBox,
                    fontWeight: FontWeight.normal,
                  )
                      : Row(
                    children: [
                      Image.network(
                        selectedItem['image']!,
                        width: 30,
                        height: 50,
                      ),
                      SizedBox(width: 8),
                      CustomText(text: selectedItem['name']!, fontSize: 3.5),
                    ],
                  );
                },
                popupProps: PopupProps.menu(

                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    cursorColor: CryptoColor.textFormField,
                    decoration: InputDecoration(

                      hintText: "Search Country",
                      hintStyle: TextStyle(color: CryptoColor.cardBox),
                      //border: InputBorder.none
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: CryptoColor.textNormal.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  itemBuilder: (context, country, isSelected) {
                    return ListTile(
                      leading: Image.network(
                        country['image']!,
                        width: 30,
                        height: 50,
                      ),
                      title: Text(country['name']!),
                    );
                  },
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(

                  dropdownSearchDecoration: InputDecoration(

                    fillColor: CryptoColor.textFormField,
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Select Country",
                    hintStyle: TextStyle(color: CryptoColor.cardBox),
                  ),
                ),
                items: countries,
                onChanged: (value) {
                  setState(() {

                    selectedCountry = value?['name'];
                  });
                },
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
