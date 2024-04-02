import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';

import '../auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.whiteColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },

              children: [
                itemPagaView('Book a flight', 'Found a flight that matches your destination and schedule? Book it instantly.', 'assets/Screenshot_1.png'),
                itemPagaView('Find a hotel room', 'Select the day, book your room. We give you the best price.', 'assets/Bitmap.png'),
                itemPagaView('Enjoy your trip', 'Easy discovering new places and share these between your friends and travel together.', 'assets/Screenshot_2.png'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      height: 10.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
                                height: 8,
                                width: _currentPage == index ? 25 : 8,
                                decoration: BoxDecoration(
                                  color: _currentPage == index ? ThemeColor.orangeColor : ThemeColor.sliverColor ,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_currentPage == 2) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false,
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: ThemeColor.purpleColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(_currentPage == 2 ? 'Get Started': 'Next', style: TextStyle(color: ThemeColor.whiteColor, fontSize: 16.sp),),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget itemPagaView(String textTile, String contentText, String dataImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dataImage),
                fit: BoxFit.cover
              )
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Text(textTile, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(contentText),
        ),
      ],
    );
  }
}

