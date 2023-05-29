// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/withDriverCustomer_Controller.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/providers/hotelCustomer_provider.dart';
import 'package:guided_traveler/providers/withDriverCustomer_Provider.dart';
import 'package:guided_traveler/screens/main/profile/profile_Screen.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WithDriverNewCustomer extends StatefulWidget {
  WithDriverNewCustomer({super.key});

  @override
  State<WithDriverNewCustomer> createState() => _WithDriverNewCustomerState();
}

class _WithDriverNewCustomerState extends State<WithDriverNewCustomer> {
  final emergencyName = [
    'Police',
    'Ambulance',
    'Tourist Police',
    'Report Crimes',
  ];

  final emergencyNumber = [
    '119/118',
    '110/1990',
    '011-2421052',
    '011-2691500',
  ];

  final List<withDriverCustomerModel> _wbbookings = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<userProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: StreamBuilder<QuerySnapshot>(
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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Logger().i(snapshot.data!.docs.length);
                _wbbookings.clear();

                for (var e in snapshot.data!.docs) {
                  Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                  var model = withDriverCustomerModel.fromJason(data);

                  _wbbookings.add(model);
                }
                return Scaffold(
                    // appBar: AppBar(
                    //     title: const CustomText(
                    //       'Vehicle Booking',
                    //       fontSize: 24,
                    //       color: AppColors.white,
                    //     ),
                    //     elevation: 1.0,
                    //     leading: IconButton(
                    //       onPressed: () {
                    //         utillFunction.goBack(context);
                    //       },
                    //       icon: Icon(Icons.arrow_back),
                    //       color: Colors.white,
                    //     )),
                    body: Consumer<WithDriverCustomerProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _wbbookings.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Card(
                            color: const Color.fromRGBO(229, 248, 252, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        _wbbookings[index].name,
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 20),
                                      CustomText(
                                        "No Of Vehicle :" +
                                            "" +
                                            _wbbookings[index].vehicleNo,
                                        fontSize: 20,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    "Pickup Date : " +
                                        _wbbookings[index]
                                            .withDriverCustomerPickUp,
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    "PickOut Date : " +
                                        _wbbookings[index]
                                            .withDriverCustomerPickOut,
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    "PickUp Location : " +
                                        _wbbookings[index]
                                            .withDriverCustomerPickUpLocation,
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    "Customer No : " +
                                        _wbbookings[index]
                                            .withDriverCustomerWhatsappNo,
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                  CustomText(
                                    "Customer Mail : " +
                                        _wbbookings[index].email,
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(height: 15),
                                  // customButton(
                                  //     onTap: () {
                                  //       WithDriverCustomerController()
                                  //           .deleteBooking(
                                  //               _wbbookings[index].docId);
                                  //     },
                                  //     text: "Done")
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ));
              }),
        );
      },
    );
  }
}
