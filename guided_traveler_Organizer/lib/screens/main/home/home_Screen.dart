import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/withDriverCustomer_Controller.dart';
import 'package:guided_traveler/controllers/withOutDriverCustomer_Controller.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/models/withOutDriverCustomer_model.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:guided_traveler/providers/withDriverCustomer_Provider.dart';
import 'package:guided_traveler/screens/main/home/driver_Customeer/vehicleBooking.dart';
import 'package:guided_traveler/screens/main/home/driver_Customeer/withDriver_VehicleBooking.dart';
import 'package:guided_traveler/screens/main/home/driver_Customeer/withOutDriver_VehicleBooking.dart';
import 'package:guided_traveler/screens/main/home/driver_register_form.dart';
import 'package:guided_traveler/screens/main/home/hotel/hotel_register_form.dart';
import 'package:guided_traveler/screens/main/home/newHotel_customer.dart';
import 'package:guided_traveler/screens/main/home/notification/notification.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class homeScreen extends StatelessWidget {
  List<int> selectedIndices = [];

  final List<withDriverCustomerModel> _withDriverbookings = [];
  final List<withOutDriverCustomerModel> _withOutDriverbookings = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        //utillFunction.navigateTo(context, grid.)
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const CustomText(
              'Home',
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.person_rounded,
                          size: 150,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            utillFunction.navigateTo(
                                context, const driverRegisterForm());
                          },
                          child: Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 170, 172, 232),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(height: 25),
                                Icon(
                                  Icons.drive_eta_rounded,
                                  size: 80,
                                ),
                                CustomText(
                                  'Register New \n Driver',
                                  color: Colors.black45,
                                  fontSize: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Consumer<userProvider>(
                              builder: (context, value, child) {
                                return StreamBuilder<QuerySnapshot>(
                                  stream: WithDriverCustomerController()
                                      .getBookings(value.userModel!.email),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: CustomText(
                                          "No Bookings yet",
                                          fontSize: 20,
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    Logger().i(snapshot.data!.docs.length);
                                    _withDriverbookings.clear();

                                    for (var e in snapshot.data!.docs) {
                                      Map<String, dynamic> data =
                                          e.data() as Map<String, dynamic>;
                                      var model = withDriverCustomerModel
                                          .fromJason(data);

                                      _withDriverbookings.add(model);
                                    }

                                    return badges.Badge(
                                      position: badges.BadgePosition.topEnd(
                                          top: -14, end: -10),
                                      badgeStyle: badges.BadgeStyle(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          elevation: 0,
                                          shape: badges.BadgeShape.circle,
                                          badgeColor:
                                              _withDriverbookings.isNotEmpty
                                                  ? Colors.red.shade700
                                                  : Colors.transparent),
                                      badgeContent: CustomText(
                                        "${_withDriverbookings.length}",
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          utillFunction.navigateTo(
                                              context, WithDriverNewCustomer());
                                        },
                                        child: Container(
                                            width: 220,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 170, 172, 232),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            child: Column(
                                              children: const [
                                                // SizedBox(height: 25),
                                                // Icon(
                                                //   Icons.attach_money_sharp,
                                                //   size: 80,
                                                // ),
                                                CustomText(
                                                  'With Driver \nCustomer \n Available',
                                                  color: Colors.black45,
                                                  fontSize: 20,
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Consumer<userProvider>(
                              builder: (context, value, child) {
                                return StreamBuilder<QuerySnapshot>(
                                  stream: WithOutDriverCustomerController()
                                      .getBookings(value.userModel!.email),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: CustomText(
                                          "No Bookings yet",
                                          fontSize: 20,
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    Logger().i(snapshot.data!.docs.length);

                                    _withOutDriverbookings.clear();

                                    for (var e in snapshot.data!.docs) {
                                      Map<String, dynamic> data =
                                          e.data() as Map<String, dynamic>;

                                      var model = withOutDriverCustomerModel
                                          .fromJason(data);

                                      _withOutDriverbookings.add(model);
                                    }

                                    return badges.Badge(
                                      position: badges.BadgePosition.topEnd(
                                          top: -14, end: -10),
                                      badgeStyle: badges.BadgeStyle(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          elevation: 0,
                                          shape: badges.BadgeShape.circle,
                                          badgeColor:
                                              _withOutDriverbookings.isNotEmpty
                                                  ? Colors.red.shade700
                                                  : Colors.transparent),
                                      badgeContent: CustomText(
                                        "${_withOutDriverbookings.length}",
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          utillFunction.navigateTo(context,
                                              WithOutDriverNewCustomer());
                                        },
                                        child: Container(
                                            width: 220,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 170, 172, 232),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            child: Column(
                                              children: const [
                                                SizedBox(height: 25),
                                                // Icon(
                                                //   Icons.attach_money_sharp,
                                                //   size: 80,
                                                // ),
                                                CustomText(
                                                  'With Out Driver\n Customer ',
                                                  color: Colors.black45,
                                                  fontSize: 20,
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            utillFunction.navigateTo(
                                context, const HotelRegisterForm());
                          },
                          child: Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 170, 172, 232),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Column(
                                children: const [
                                  SizedBox(height: 25),
                                  Icon(
                                    Icons.hotel,
                                    size: 80,
                                  ),
                                  CustomText(
                                    'Register New \n Hotel',
                                    color: Colors.black45,
                                    fontSize: 20,
                                  )
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            utillFunction.navigateTo(
                                context, hotelNewCustomer());
                          },
                          child: Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 170, 172, 232),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Column(
                                children: const [
                                  SizedBox(height: 25),
                                  Icon(
                                    Icons.attach_money_sharp,
                                    size: 80,
                                  ),
                                  CustomText(
                                    'Hotel Customer \n Available',
                                    color: Colors.black45,
                                    fontSize: 20,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        utillFunction.navigateTo(context, nortificationGrid());
                      },
                      child: Container(
                          width: size.width,
                          height: 220,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 170, 172, 232),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Column(
                            children: const [
                              SizedBox(height: 25),
                              Icon(
                                Icons.chat_bubble,
                                size: 100,
                              ),
                              CustomText(
                                'Admin Massage',
                                color: Colors.black45,
                                fontSize: 20,
                              )
                            ],
                          )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
