import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/screens/admin/admin.dart';
import 'package:guided_traveler/screens/main/profile/driver_Customeer/vehicleBooking.dart';
import 'package:guided_traveler/screens/main/profile/hotelBooking.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 231, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomText(
          'Profile',
          color: Colors.white,
        ),
      ),
      body: SafeArea(child: Consumer<userProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: Size.width,
                      height: 350,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 270,
                      child: InkWell(
                        onTap: () => value.selectAndUploadProfileImage(),
                        child: value.isLoading
                            ? CircularProgressIndicator()
                            : Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(value.userModel!.img)),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Positioned(
                      top: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            const CustomText(
                              'Welcome ,',
                              color: Colors.white,
                            ),
                            CustomText(
                              value.userModel != null
                                  ? value.userModel!.name
                                  : "",
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              value.userModel != null
                                  ? value.userModel!.email
                                  : "",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          utillFunction.navigateTo(context, hotelNewCustomer());
                        },
                        child: Container(
                            width: Size.width,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.hotel,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 20),
                                  CustomText(
                                    'Hotel Booking',
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          utillFunction.navigateTo(
                              context, mainVehicleBooking());
                        },
                        child: Container(
                            width: Size.width,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.car_crash_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 20),
                                  CustomText(
                                    'Vehicle Booking',
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          AuthController.signOutUser();
                        },
                        child: Container(
                            width: Size.width,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 20),
                                  CustomText(
                                    'Logout',
                                    color: Colors.red,
                                    fontSize: 25,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
