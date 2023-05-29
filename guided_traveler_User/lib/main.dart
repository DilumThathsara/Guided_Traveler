import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/firebase_options.dart';
import 'package:guided_traveler/providers/admin/admin_provider.dart';
import 'package:guided_traveler/providers/auth/login_provider.dart';
import 'package:guided_traveler/providers/auth/signup_provider.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/providers/driver_Provider.dart';
import 'package:guided_traveler/providers/hotelBooking_Provider.dart';
import 'package:guided_traveler/providers/hotelCustomer_provider.dart';
import 'package:guided_traveler/providers/hotel_Provider.dart';
import 'package:guided_traveler/providers/location_Provider.dart';
import 'package:guided_traveler/providers/tracking_provider.dart';
import 'package:guided_traveler/providers/withDriverBooking_Provider.dart';
import 'package:guided_traveler/providers/withDriverCustomer_Provider.dart';
import 'package:guided_traveler/providers/withOutDriverBooking_Provider..dart';
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
      ChangeNotifierProvider(create: (context) => AdminProvider()),
      ChangeNotifierProvider(create: (context) => DriverProvider()),
      ChangeNotifierProvider(create: (context) => HotelProvider()),
      ChangeNotifierProvider(create: (context) => LocationProvider()),
      ChangeNotifierProvider(create: (context) => HotelBookingProvider()),
      ChangeNotifierProvider(create: (context) => WithDriverBookingProvider()),
      ChangeNotifierProvider(
          create: (context) => WithOutDriverBookingProvider()),
      ChangeNotifierProvider(create: (context) => TrackingProvider()),
      ChangeNotifierProvider(create: (context) => hotelCustomerProvider()),
      ChangeNotifierProvider(create: (context) => WithDriverCustomerProvider()),
      ChangeNotifierProvider(
          create: (context) => WithOutDriverCustomerProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
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
