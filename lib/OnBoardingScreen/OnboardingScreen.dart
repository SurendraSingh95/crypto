import 'package:crepto/OnBoardingScreen/login_screen.dart';
import 'package:crepto/Customs/CustomText.dart';
import 'package:crepto/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboding1.png',
      'title': 'Trade with Ease',
      'description':
      'Explore the world of digital assets with ease and confidence. Swerf keeps your assets safe and accessible.',
    },
    {
      'image': 'assets/images/onboding1.png',
      'title': 'Crypto Made Simple',
      'description':
      'Swerf is built for every journey and we define the way you access and manage your crypto trading.',
    },
    {
      'image': 'assets/images/onboding1.png',
      'title': 'Invest Boldly, Trade Securely',
      'description':
      'Seamless, secure, and smarter trading at your fingertips. Swerf ensures that your trading is fully secured.',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: CryptoColor.white,
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(

                          onboardingData[index]['image']!,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Image.asset('assets/images/swerf 2.png'),
                        ),

                      ],
                    ),


                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                            (i) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == i ? 20 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == i ? CryptoColor.button : CryptoColor.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: CryptoColor.button )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextCenter(text: onboardingData[index]['title']!, fontSize: 5,color: CryptoColor.textBold,fontWeight: FontWeight.bold,),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextCenter(text: onboardingData[index]['description']!, fontSize: 4,color: CryptoColor.textNormal,),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>LoginScreen());
                  _controller.animateToPage(
                    onboardingData.length - 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: CustomText(text: 'Skip', fontSize: 4,fontWeight: FontWeight.bold,color:  CryptoColor.button,),
              ),
            ),
      
          /*  Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  if (_currentPage == onboardingData.length - 1) {
                    Get.to(()=>LoginScreen());
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: CryptoColor.button,
                    shape: BoxShape.circle,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.orange.withOpacity(0.5),
                    //     spreadRadius: 3,
                    //     blurRadius: 8,
                    //   ),
                    // ],
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),*/
            Stack(
              children: [
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage == onboardingData.length - 1) {
                        Get.to(() => LoginScreen());
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child:Image.asset(
                        _currentPage == 0 ? 'assets/images/Onboarding.png' :
                        _currentPage == 1 ? 'assets/images/Onboarding (1).png' :
                        'assets/images/Onboarding (2).png',
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
