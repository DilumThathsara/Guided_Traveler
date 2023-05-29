import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/firebase_options.dart';
import 'package:guided_traveler/providers/hotelCustomer_provider.dart';
import 'package:guided_traveler/providers/hotelRegister_provider.dart';
import 'package:guided_traveler/providers/login_provider.dart';
import 'package:guided_traveler/providers/notification_provider.dart';
import 'package:guided_traveler/providers/registration_provider.dart';
import 'package:guided_traveler/providers/signup_provider.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:guided_traveler/providers/withDriverCustomer_Provider.dart';
import 'package:guided_traveler/providers/withOutDriverCustomer_Provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:guided_traveler/screens/auth/splash_Screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignupProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => userProvider()),
      ChangeNotifierProvider(create: (context) => registerProvider()),
      ChangeNotifierProvider(create: (context) => hotelRegisterProvider()),
      ChangeNotifierProvider(create: (context) => hotelCustomerProvider()),
      ChangeNotifierProvider(create: (context) => WithDriverCustomerProvider()),
      ChangeNotifierProvider(
          create: (context) => WithOutDriverCustomerProvider()),
      ChangeNotifierProvider(create: (context) => NotificationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor mycolor = const MaterialColor(0xff6368DE, <int, Color>{
      50: Color(0xff6368DE),
      100: Color(0xff6368DE),
      200: Color(0xff6368DE),
      300: Color(0xff6368DE),
      400: Color(0xff6368DE),
      500: Color(0xff6368DE),
      600: Color(0xff6368DE),
      700: Color(0xff6368DE),
      800: Color(0xff6368DE),
      900: Color(0xff6368DE),
    });
    return MaterialApp(
      home: const splashScreen(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      theme: ThemeData(

          //primaryColor: AppColors.primaryColor,

          primarySwatch: mycolor),
    );
  }
}
