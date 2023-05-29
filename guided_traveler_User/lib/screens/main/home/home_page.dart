import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/models/hotels.dart';
import 'package:guided_traveler/models/offers.dart';
import 'package:guided_traveler/screens/main/drawer/drawer.dart';
import 'package:guided_traveler/screens/main/home/home_Screen.dart';
import 'package:guided_traveler/screens/main/home/widgets/menu_Grid.dart';
import 'package:guided_traveler/screens/hotel/hotel_booking_form.dart';
import 'package:guided_traveler/screens/offers/offer_Grid.dart';
import 'package:guided_traveler/screens/roots/roots_Grid.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class mainHomeScreen extends StatefulWidget {
  const mainHomeScreen({super.key});

  @override
  State<mainHomeScreen> createState() => _mainHomeScreenState();
}

class _mainHomeScreenState extends State<mainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const CustomText(
            'Home',
            color: Colors.white,
          ),
          elevation: 1,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.menu),
          // ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, OfferGrid());
                    },
                    child: Container(
                      width: size.width,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("${AssetConstants.offers}"),
                            fit: BoxFit.cover),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Speicle Offer',
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Container(
                    height: 580,
                    child: menuGrid(),
                  ),
                  //const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, const rootGrid());
                    },
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("${AssetConstants.roots}"),
                            fit: BoxFit.cover),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Speicle Roots',
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
