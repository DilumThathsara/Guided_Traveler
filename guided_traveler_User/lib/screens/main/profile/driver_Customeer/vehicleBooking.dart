import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/screens/auth/logIn.dart';
import 'package:guided_traveler/screens/main/profile/driver_Customeer/withDriver_VehicleBooking.dart';
import 'package:guided_traveler/screens/main/profile/driver_Customeer/withOutDriver_VehicleBooking.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class mainVehicleBooking extends StatefulWidget {
  mainVehicleBooking({Key? key}) : super(key: key);
  @override
  State<mainVehicleBooking> createState() => _mainVehicleBookingState();
}

class _mainVehicleBookingState extends State<mainVehicleBooking> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    WithDriverNewCustomer(),
    WithOutDriverNewCustomer(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'Vehicle Booking',
              fontSize: 24,
              color: AppColors.white,
            ),
            elevation: 1.0,
            leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            )),
        body: _screens.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.drive_eta_rounded), label: 'With Driver'),
            BottomNavigationBarItem(
              icon: Icon(Icons.drive_eta_rounded),
              label: 'WithOut Driver',
              //backgroundColor: Colors.white,
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          selectedIconTheme: const IconThemeData(size: 40.0),
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
