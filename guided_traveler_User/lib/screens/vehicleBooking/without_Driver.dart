import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/driver_Provider.dart';
import 'package:guided_traveler/screens/vehicleBooking/vehicleDetails/with_Driver_details.dart';
import 'package:guided_traveler/screens/vehicleBooking/vehicleDetails/without_Driver_details.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class withoutDriverList extends StatelessWidget {
  withoutDriverList({super.key});

  final vehicleIcon = [
    'bicycle.png',
    'bike.png',
    'sedan.png',
    'suv.png',
    'van.png',
  ];

  final vehicleName = [
    'Bicycle',
    'Motorbike',
    'Car',
    'Suv',
    'Van',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: value.withOutDriversModel.length,
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
                                        value.withOutDriversModel[index].img,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 25),
                            CustomText(
                              value.withOutDriversModel[index].vehicleType,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 25),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  elevation: 5),
                              onPressed: () {
                                value.setWithOutDriverVehicle =
                                    value.withOutDriversModel[index];

                                utillFunction.navigateTo(
                                    context, withOutDriverDetails());
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
        );
      },
    );
  }
}
