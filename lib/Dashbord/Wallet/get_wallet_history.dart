import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/Customs/customAppBar.dart';
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/constants.dart';
import 'package:flutter/material.dart';

class WalletHistoryScreen extends StatefulWidget {
  const WalletHistoryScreen({super.key});

  @override
  _WalletHistoryScreenState createState() => _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends State<WalletHistoryScreen> {
  int _selectedIndex = 0;

  final List<List<Map<String, String>>> transactions = [
    [
      {'title': 'Received ETH', 'details': 'Coin from oluwatosin.eth', 'amount': '+0.3898320 BTC', 'time': '11:30 am'},
      {'title': 'Sent BTC', 'details': 'Coin to stephen.eth', 'amount': '-0.0890 BTC', 'time': '11:30 am'},
      {'title': 'Swap', 'details': 'Ethereum to BNB', 'amount': '+0.3898320 BTC', 'time': '11:30 am'},
    ],
    [
      {'title': 'Sent BTC', 'details': 'Coin to stephen.eth', 'amount': '-0.0890 BTC', 'time': '11:30 am'},
    ],
    [
      {'title': 'Sent BTC', 'details': 'Coin to stephen.eth', 'amount': '-0.0890 BTC', 'time': '11:30 am'},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColor.white,
     appBar: CustomSimpleAppBar(title: "Transaction History"),
      body: Column(
        children: [
          Card(
            color: CryptoColor.textFormField,
            shape: RoundedRectangleBorder(),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton('Successful', 0),
                  _buildButton('Pending', 1),
                  _buildButton('Failed', 2),
                ],
              ),
            ),
          ),
          Expanded(
            child: TransactionList(transactions: transactions[_selectedIndex]),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedIndex == index ? CryptoColor.button : CryptoColor.textFormField,
        foregroundColor: _selectedIndex == index ?  CryptoColor.white:  CryptoColor.textNormal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0, // Remove button elevation
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(text),
    );
  }

}
double large = Constants.largeSize;
double h = Constants.screen.height;
double w = Constants.screen.width;

class TransactionList extends StatelessWidget {
  final List<Map<String, String>> transactions;

  const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final isPositive = transaction['amount']!.startsWith('+');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: CryptoColor.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: CryptoColor.cardBox)
            ),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/home/recive.png',scale: 1.5,),
                          SizedBox(width: large*0.01,),
                          CustomText(text: transaction['title']!, fontSize: 4,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),

                        ],
                      ),
                      InkWell(
                          onTap: (){

                          },
                          child: CustomText(text: transaction['amount']!, fontSize: 3,color: isPositive ? CryptoColor.textGreen :  CryptoColor.textRed,fontWeight: FontWeight.bold,)),

                    ],
                  ),
                  SizedBox(height: 2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: transaction['details']!, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),
                        CustomText(text: transaction['time']!, fontSize: 3,color: CryptoColor.textNormal,fontWeight: FontWeight.normal,),

                      ],
                    ),
                  ),
                ],
              ),
            )


            // ListTile(
            //   leading: CircleAvatar(
            //     backgroundColor: isPositive ? Colors.green : Colors.red,
            //     child: const Icon(Icons.monetization_on, color: Colors.white),
            //   ),
            //   title: Text(transaction['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            //   subtitle: Text(transaction['details']!),
            //   trailing: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         transaction['amount']!,
            //         style: TextStyle(
            //           color: isPositive ? Colors.green : Colors.red,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(transaction['time']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            //     ],
            //   ),
            // ),
          ),
        );
      },
    );
  }
}

