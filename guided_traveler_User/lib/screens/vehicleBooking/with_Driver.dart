import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/providers/driver_Provider.dart';
import 'package:guided_traveler/screens/hotel/hotel_Details.dart';
import 'package:guided_traveler/screens/vehicleBooking/vehicleBookingForm/vehicleBookingForm.dart';
import 'package:guided_traveler/screens/vehicleBooking/vehicleDetails/with_Driver_details.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class withDriverList extends StatefulWidget {
  withDriverList({super.key});

  @override
  State<withDriverList> createState() => _withDriverListState();
}

class _withDriverListState extends State<withDriverList> {
  final List<withDriverModel> withDriverVehicle = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<DriverProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: value.withDriversModel.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: const Color.fromRGBO(229, 248, 252, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          value.withDriversModel[index].img,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(width: 25),
                              CustomText(
                                value.withDriversModel[index].vehicleType,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 25),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    elevation: 5),
                                onPressed: () {
                                  value.setWithDriverVehicle =
                                      value.withDriversModel[index];
                                  utillFunction.navigateTo(
                                      context, withDriverDetails());
                                },
                                child: const Text(
                                  'Book now',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
