import 'package:crepto/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Home/home_screen.dart';
import 'Home/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    // WalletScreen(),
    // TradeScreen(),
    // ServicesScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/home/home_user.png', // Replace with user's image
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, John 👋",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  "Available Balance NGN",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Image.asset('assets/home/scannr.png',scale: 1.2,),
          ),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
                Get.to(()=>NotificationScreen());
              },
                child: Image.asset('assets/home/bell.png',scale: 1.2,)),
          ),
        ],
      ),
       body: _screens[_currentIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor:CryptoColor.button,
        unselectedItemColor:CryptoColor.textBold,
        backgroundColor:CryptoColor.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildImageWithBackground('assets/home/home.png', "Home", 0),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _buildImageWithBackground('assets/home/wallet_outline_icon.png', "Wallet", 1),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: _buildImageWithBackground('assets/home/bottom3.png', "Trade", 2),
            label: "Trade",
          ),
          BottomNavigationBarItem(
            icon: _buildImageWithBackground('assets/home/money_regular_icon.png', "Services", 3),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: _buildImageWithBackground('assets/home/person.png', "Profile", 4),
            label: "Profile",
          ),
        ],
      ),


    );
  }
  Widget _buildImageWithBackground(String imagePath, String label, int index) {
    final bool isSelected = _currentIndex == index;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 40, // Size of the circular background
            height: 40,
            decoration: BoxDecoration(
              color:CryptoColor.button.withOpacity(0.2), // Background color for the selected item
              shape: BoxShape.circle, // Circular shape
            ),
          ),
        Image.asset(
          imagePath,
          width: 24, // Adjust the size of the image
          height: 24,
          color: isSelected ?CryptoColor.button :CryptoColor.textBold, // Color of the image
        ),
      ],
    );
  }



}
