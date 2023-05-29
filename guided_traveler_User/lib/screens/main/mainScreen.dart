import 'dart:async';

import 'package:alan_voice/alan_callback.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/models/offers.dart';
import 'package:guided_traveler/providers/location_Provider.dart';
import 'package:guided_traveler/screens/Foods/food_Grid.dart';
import 'package:guided_traveler/screens/emergency/emergency_Grid.dart';
import 'package:guided_traveler/screens/hotel/hotel_Grid.dart';
import 'package:guided_traveler/screens/main/favourites/favourite_Screen.dart';
import 'package:guided_traveler/screens/main/home/home_page.dart';
import 'package:guided_traveler/screens/main/map/map_Screen.dart';
import 'package:guided_traveler/screens/main/map/map_ex.dart';
import 'package:guided_traveler/screens/main/profile/profile_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:guided_traveler/screens/offers/offer_Grid.dart';
import 'package:guided_traveler/screens/roots/roots_Grid.dart';
import 'package:guided_traveler/screens/travelNews/travel_News.dart';
import 'package:guided_traveler/screens/vehicleBooking/main_Vehicle_ListView.dart';
import 'package:guided_traveler/screens/visitingPlace/province/Uva_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/central_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/eastern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northCentral_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northWestern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/sabaragamuwa_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/southern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/western_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province_Grid.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    setupAlan();
    trackingUser();
  }

  void trackingUser() async {
    String lat = await Provider.of<LocationProvider>(context, listen: false)
            .getCurrenlatitude() ??
        '';

    String lon = await Provider.of<LocationProvider>(context, listen: false)
            .getCurrenlongitude() ??
        '';

    Timer mytimer = Timer.periodic(Duration(seconds: 30), (timer) {
      Provider.of<LocationProvider>(context, listen: false)
          .trackingCustomer(lat.toString(), lon.toString(), context);
    });
  }

  setupAlan() {
    AlanVoice.addButton(
        "fb00e526c7c2272da05cb7e4656ca5cf2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "forward":
        utillFunction.navigateTo(context, const provinceGrid());
        break;
      case "forwardCentral":
        utillFunction.navigateTo(context, const centralProvince());
        break;
      case "forwardEastern":
        utillFunction.navigateTo(context, const easternProvince());
        break;
      case "forwardNorthern":
        utillFunction.navigateTo(context, const northernProvince());
        break;
      case "forwardSouthern":
        utillFunction.navigateTo(context, const southernProvince());
        break;
      case "forwardWestern":
        utillFunction.navigateTo(context, const westernProvince());
        break;
      case "forwardNorthWestern":
        utillFunction.navigateTo(context, const northWesternProvince());
        break;
      case "forwardNorthCentral":
        utillFunction.navigateTo(context, const northCentralProvince());
        break;

      case "forwardUva":
        utillFunction.navigateTo(context, const UvaProvince());
        break;
      case "forwardSabaragamuwa":
        utillFunction.navigateTo(context, const sabaragamuwaProvince());
        break;
      case "backhome":
        utillFunction.navigateTo(context, const MainScreen());
        break;
      case "back":
        utillFunction.goBack(context);
        break;
      case "forwardVehicle":
        utillFunction.navigateTo(context, mainVehicleListView());
        break;
      case "forwardHotel":
        utillFunction.navigateTo(context, hotelGrid());
        break;
      case "forwardoffers":
        utillFunction.navigateTo(context, OfferGrid());
        break;
      case "forwardEmergency":
        utillFunction.navigateTo(context, emergencyGrid());
        break;
      case "forwardfood":
        utillFunction.navigateTo(context, foodGrid());
        break;
      case "forwardpackages":
        utillFunction.navigateTo(context, const rootGrid());
        break;
      case "forwardtravelnews":
        utillFunction.navigateTo(context, const travelNews());
        break;
    }
  }

  //-------store the active index
  int activeIndex = 0;

  //----trigger when bottom nav item is clicked
  void onItemTapped(int val) {
    setState(() {
      activeIndex = val;
    });
  }

  //-------screen list
  final List<Widget> _screens = [
    const mainHomeScreen(),
    const MapLocation(),
    //const map(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: _screens.elementAt(activeIndex),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    // GButton(
                    //   icon: LineIcons.heart,
                    //   text: 'favourites',
                    // ),
                    GButton(
                      icon: LineIcons.map,
                      text: 'Map',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: activeIndex,
                  onTabChange: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
