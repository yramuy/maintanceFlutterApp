import 'dart:async';
import 'dart:developer';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:maintenanceapp/views/bottompages/bottomnavigationbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/constants.dart';
import 'homescreen.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 1.0;
  bool loginValue = false;
  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    getLoginStatus();
    Timer(const Duration(seconds: 3), () {
      _changeOpacity();
    });
  }

  getLoginStatus() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    if (userPref.getBool('isLogin') == false) {
      setState(() {
        loginValue = false;
      });
    } else {
      setState(() {
        loginValue = true;
      });
    }

    log("login value is : ");

    log(userPref.getBool('isLogin').toString());

  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedSplashScreen(
              duration: 3000,
              splash: ClipOval(
                child: Image.asset(
                  Constants.logoImage,
                  scale: 1.2,
                  fit: BoxFit.cover,
                ),
              ),
              nextScreen: loginValue == true ? const BottomNavigationTileScreen() : const LoginScreen(),
              animationDuration: const Duration(seconds: 3),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.topToBottom,
              splashIconSize: 200,
              backgroundColor: const Color(0xFF024702).withOpacity(0.6),
            ),
          )
        ],
      ),
    ));
  }
}
