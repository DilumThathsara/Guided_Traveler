import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/screens/auth/signUp.dart';
import 'package:guided_traveler/screens/main/home/home_Screen.dart';
import 'package:guided_traveler/screens/main/mainScreen.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Provider.of<userProvider>(context, listen: false)
            .initializeUser(context);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              child: Image.asset(
                'assets/image/logo.png',
                width: 331,
                height: 225,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
                child: const CustomText(
              'Guided Traveler',
              color: AppColors.primaryColor,
            )),
          ],
        ),
      ),
    );
  }
}
