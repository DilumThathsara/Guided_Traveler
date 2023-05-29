import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/hotelCustomer_Controller.dart';
import 'package:guided_traveler/controllers/withDriverCustomer_Controller.dart';
import 'package:guided_traveler/models/hotelCustomer_model.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/providers/hotelCustomer_provider.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class hotelNewCustomer extends StatefulWidget {
  hotelNewCustomer({super.key});

  @override
  State<hotelNewCustomer> createState() => _hotelNewCustomerState();
}

class _hotelNewCustomerState extends State<hotelNewCustomer> {
  final List<hotelCustomerModel> _hotelbookings = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<userProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  HotelCustomerController().getBookings(value.userModel!.email),
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
                _hotelbookings.clear();

                for (var e in snapshot.data!.docs) {
                  Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                  var model = hotelCustomerModel.fromJason(data);

                  _hotelbookings.add(model);
                }
                return Scaffold(
                    appBar: AppBar(
                        title: const CustomText(
                          'New Customer in the Hotel',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        elevation: 10.0,
                        leading: IconButton(
                            onPressed: () {
                              utillFunction.goBack(context);
                            },
                            icon: Icon(Icons.arrow_back))),
                    body: Consumer<hotelCustomerProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: _hotelbookings.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Card(
                                color: const Color.fromRGBO(229, 248, 252, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              _hotelbookings[index].name,
                                              fontSize: 25,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(height: 20),
                                            CustomText(
                                              "No Of Gust :" +
                                                  "" +
                                                  _hotelbookings[index]
                                                      .NoOfGust,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomText(
                                        _hotelbookings[index].email,
                                        fontSize: 20,
                                        color: Colors.black54,
                                      ),
                                      const SizedBox(height: 5),
                                      CustomText(
                                        "Phone No :" +
                                            "" +
                                            _hotelbookings[index]
                                                .customerPhoneNo,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 5),
                                      CustomText(
                                        "Check Out :" +
                                            "" +
                                            _hotelbookings[index]
                                                .customerCheckOut,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 5),
                                      CustomText(
                                        "Check In :" +
                                            "" +
                                            _hotelbookings[index]
                                                .customerCheckIn,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
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
