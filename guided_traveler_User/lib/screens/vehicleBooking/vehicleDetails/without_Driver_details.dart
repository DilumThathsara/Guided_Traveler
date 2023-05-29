// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/hotels.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/providers/driver_Provider.dart';
import 'package:guided_traveler/screens/main/home/widgets/counter_Section.dart';
import 'package:guided_traveler/screens/hotel/hotel_booking_form.dart';
import 'package:guided_traveler/screens/vehicleBooking/vehicleBookingForm/withOutvehicleBookingForm.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class withOutDriverDetails extends StatefulWidget {
  const withOutDriverDetails({super.key});

  @override
  State<withOutDriverDetails> createState() => _withOutDriverDetailsState();
}

class _withOutDriverDetailsState extends State<withOutDriverDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<DriverProvider>(
          builder: (context, value, child) {
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: 310,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEE0F8),
                    ),
                    child: Image.network(
                      value.getWithOutDriverModel.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 280,
                    child: Container(
                      width: size.width,
                      height: size.height,
                      padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(34),
                            topRight: Radius.circular(34)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            value.getWithOutDriverModel.vehicleName,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                value.getWithOutDriverModel.vehicleType,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                              CustomText(
                                value.getWithOutDriverModel.vehicleNo,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          CustomText(
                            "Vehicle Owner Phone Number : " +
                                value.getWithOutDriverModel.vehiclePhoneNo,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            "Vehicle Email : " +
                                value.getWithOutDriverModel.vehicleEmail,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customButton(
                            onTap: () {
                              utillFunction.navigateTo(
                                  context, withOutDriverVehicleBookingForm());
                            },
                            text: "Booking"),
                        const SizedBox(
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
