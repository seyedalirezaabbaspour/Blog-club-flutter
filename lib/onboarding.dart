import 'package:blogclub/auth.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController =PageController(); 
  final items = AppDatabase.onBoardingItems;
  int page=0;

  @override
  void initState() {
    _pageController.addListener((){
      if (_pageController.page!.round() != page){
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbfcff),
        body: 
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Assets.img.background.onBoarding.image(),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
                ]
            
              ),

              child: Column(
                children: [
                  Expanded(child: PageView.builder(
                    itemCount: items.length,
                    controller: _pageController,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items[index].title, style: themeData.textTheme.titleLarge,),
                            SizedBox(height: 24,),
                            Text(items[index].description, style: themeData.textTheme.bodySmall,)
                          ],
                        ),
                      );
                  })),
                  Container(
                    padding: EdgeInsets.only(right: 32, left: 32, bottom: 8),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                        controller: _pageController, 
                        count: items.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: themeData.colorScheme.primary,
                          dotColor: themeData.colorScheme.primary.withOpacity(0.1)),),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(themeData.colorScheme.primary),
                            minimumSize: WidgetStateProperty.all(Size(85, 60)),
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                          onPressed: (){
                            if(page == items.length-1){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => AuthScreen())
                              );
                            }else{
                              _pageController.animateToPage(page+1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                            }
                          },
                          
                           child:  Icon(page==items.length-1?CupertinoIcons.check_mark:CupertinoIcons.arrow_right, color: Colors.white,))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}