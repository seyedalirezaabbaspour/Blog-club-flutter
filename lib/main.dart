import 'dart:io';

import 'package:blogclub/article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secendaryTextColor = Color(0xff2d4379);
    const primaryColor = Color(0xff376aed);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              background: Color(0xfffbfcff),
              surface: Colors.white),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
            titleSpacing: 32,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.avenir)))),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w400,
                color: primaryTextColor,
                fontSize: 16),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w400,
                color: primaryTextColor,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 26),
            titleMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secendaryTextColor,
                fontSize: 14),
            labelSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              color: Color(0xff7b8bb2),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          )),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       left: 0,
      //       child: _BottomNavigation())

      //   ],
      // ),

      home: const MainScreen(),
    );
  }
}

const homeIndex = 0;
const articleIndex = 1;
const searchIndex = 2;
const menuIndex = 3;
const double bottomNavigationHeight = 65;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  final List<int> _history = [];
  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searcheKey = GlobalKey();
  GlobalKey<NavigatorState> _menueKey = GlobalKey();

  late final map = {
    homeIndex:_homeKey,
    articleIndex:_articleKey,
    searchIndex:_searcheKey,
    menuIndex:_menueKey
  };

  // Future<bool> _onWillPop() async {
  //   final NavigatorState currentSelectedTabNavigatorState = map[selectedScreenIndex]!.currentState!;
    
  //   if (currentSelectedTabNavigatorState.canPop()){
  //     currentSelectedTabNavigatorState.pop();
  //     return false;
  //   }
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    bool canPopNow = false;
    return PopScope(
      canPop: canPopNow,
      onPopInvokedWithResult: (didPop, result) async{
        final NavigatorState currentSelectedTabNavigatorState = map[selectedScreenIndex]!.currentState!;
    
    if (currentSelectedTabNavigatorState.canPop()){
      currentSelectedTabNavigatorState.pop(); 
    }else if(_history.isNotEmpty){
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
    }
    else{
      exit(0);
      // setState(() {
      // Navigator.of(context).pop(true);
      // canPopNow = true;
      // });
    }
      },
      // onPopInvokedWithResult: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, HomeScreen()),
                  _navigator(_articleKey, articleIndex, ArticleScreen()),
                  _navigator(_searcheKey, searchIndex, SearchScreen()),
                  _navigator(_menueKey, menuIndex, ProfileScreen()),
                  
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState==null &&selectedScreenIndex != index?Container():Navigator(
                    key: key,
                    onGenerateRoute: (setting) => MaterialPageRoute(
                        builder: (context) => Offstage(
                          offstage: selectedScreenIndex != index,
                          child:child)));
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "Search Screen",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff9b8487).withOpacity(0.3),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: "home.png",
                    activeIconFileName: "homeActive.png",
                    title: "Home",
                    onTap: () {
                      onTap(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex,
                  ),
                  BottomNavigationItem(
                    iconFileName: "Articles.png",
                    activeIconFileName: "bookActive.png",
                    title: "Article",
                    onTap: () {
                      onTap(articleIndex);
                    },
                    isActive: selectedIndex == articleIndex,
                  ),
                  Expanded(child: Container()),
                  BottomNavigationItem(
                    iconFileName: "Search.png",
                    activeIconFileName: "searchActive.png",
                    title: "Search",
                    onTap: () {
                      onTap(searchIndex);
                    },
                    isActive: selectedIndex == searchIndex,
                  ),
                  BottomNavigationItem(
                    iconFileName: "Menu.png",
                    activeIconFileName: "MenuActive.png",
                    title: "Menu",
                    onTap: () {
                      onTap(menuIndex);
                    },
                    isActive: selectedIndex == menuIndex,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: bottomNavigationHeight,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      color: Color(0xff376aed),
                      borderRadius: BorderRadius.circular(32.5)),
                  child: Image.asset("assets/img/icons/plus.png")),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/icons/${isActive ? activeIconFileName : iconFileName}",
              width: 32,
              height: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.labelSmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.labelSmall!.color),
            )
          ],
        ),
      ),
    );
  }
}
