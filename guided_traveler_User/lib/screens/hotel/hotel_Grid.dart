import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/hotels.dart';
import 'package:guided_traveler/providers/hotel_Provider.dart';
import 'package:guided_traveler/screens/hotel/hotel_Details.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class hotelGrid extends StatefulWidget {
  @override
  State<hotelGrid> createState() => _hotelGridState();
}

class _hotelGridState extends State<hotelGrid> {
  final List<Hotel> hotel = [
    Hotel(id: 1, hotelName: "abc", hotelPrice: "25.80", hotelImg: "3.jpeg"),
    Hotel(id: 2, hotelName: "avv", hotelPrice: "28.30", hotelImg: "4.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<HotelProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              title: const CustomText(
                'Hotel Booking',
                fontSize: 24,
                color: Colors.white,
              ),
              elevation: 10.0,
              leading: IconButton(
                  onPressed: () {
                    utillFunction.goBack(context);
                  },
                  icon: Icon(Icons.arrow_back))),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: value.hotelsModel.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    value.setHotel = value.hotelsModel[index];
                    utillFunction.navigateTo(
                        context, hotelDetail(hotel: hotel[index]));
                  },
                  child: Card(
                    color: const Color.fromRGBO(229, 248, 252, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: Size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        value.hotelsModel[index].hotelImg),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              height: 53,
                              width: Size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      value.hotelsModel[index].hotelName,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      value.hotelsModel[index].hotelLocation,
                                      fontSize: 20,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    ));
  }
}
