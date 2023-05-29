// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/hotels.dart';
import 'package:guided_traveler/providers/hotel_Provider.dart';
import 'package:guided_traveler/screens/main/home/widgets/counter_Section.dart';
import 'package:guided_traveler/screens/hotel/hotel_booking_form.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class hotelDetail extends StatefulWidget {
  const hotelDetail({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<hotelDetail> createState() => _hotelDetailState();
}

class _hotelDetailState extends State<hotelDetail> {
  // final List<Hotel> hotel = [
  //   Hotel(id: 1, hotelName: "abc", hotelPrice: "25.80", hotelImg: "3.jpeg"),
  //   Hotel(id: 2, hotelName: "avv", hotelPrice: "28.30", hotelImg: "4.jpg"),
  // ];

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
        body: Consumer<HotelProvider>(
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
                      value.gethotelModel.hotelImg,
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
                            value.gethotelModel.hotelName,
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
                                '${value.gethotelModel.hotelRoomPrice}',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              CustomText(
                                value.gethotelModel.hotelLocation,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            "Hotel Phone Number : " +
                                value.gethotelModel.hotelPhoneNo,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            "Hotel Email : " + value.gethotelModel.hotelEmail,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            value.gethotelModel.hotelDescription,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            textAlign: TextAlign.justify,
                          ),
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
                                  context, hotelBookingForm());
                            },
                            text: "Booking"),
                        const SizedBox(
                          height: 50,
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
