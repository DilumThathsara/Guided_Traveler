import 'package:flutter/material.dart';
import 'package:guided_traveler/models/menu.dart';
import 'package:guided_traveler/screens/Foods/food_Grid.dart';
import 'package:guided_traveler/screens/emergency/emergency_Grid.dart';
import 'package:guided_traveler/screens/main/home/widgets/menu_Tile.dart';
import 'package:guided_traveler/screens/hotel/hotel_Grid.dart';
import 'package:guided_traveler/screens/offers/offer_Grid.dart';
import 'package:guided_traveler/screens/roots/roots_Grid.dart';
import 'package:guided_traveler/screens/travelNews/travel_News.dart';
import 'package:guided_traveler/screens/vehicleBooking/main_Vehicle_ListView.dart';
import 'package:guided_traveler/screens/visitingPlace/places_Grid.dart';
import 'package:guided_traveler/screens/visitingPlace/province_Grid.dart';

class menuGrid extends StatelessWidget {
  menuGrid({
    Key? key,
  }) : super(key: key);

  final List<Menu> menu = [
    Menu(
        id: 1,
        categoryNmae: "Visiting Places",
        categoryLogo: "user.png",
        widget: provinceGrid()),
    Menu(
        id: 2,
        categoryNmae: "Vehicle Booking",
        categoryLogo: "taxi.png",
        widget: mainVehicleListView()),
    Menu(
        id: 3,
        categoryNmae: "Hotel Booking",
        categoryLogo: "hotel.png",
        widget: hotelGrid()),
    Menu(
        id: 4,
        categoryNmae: "Offers",
        categoryLogo: "offer.png",
        widget: OfferGrid()),
    Menu(
        id: 5,
        categoryNmae: "Emergency ",
        categoryLogo: "call.png",
        widget: emergencyGrid()),
    Menu(
        id: 6,
        categoryNmae: "Food",
        categoryLogo: "food.png",
        widget: foodGrid()),
    Menu(
        id: 7,
        categoryNmae: "Tour Packages",
        categoryLogo: "maps.png",
        widget: rootGrid()),
    Menu(
        id: 8,
        categoryNmae: "Travel News",
        categoryLogo: "news.png",
        widget: travelNews())
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 44,
        crossAxisSpacing: 16,
      ),
      itemCount: menu.length,
      itemBuilder: (context, index) => menuTile(menu: menu[index]),
    );
  }
}
