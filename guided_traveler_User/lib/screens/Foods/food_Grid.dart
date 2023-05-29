import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/food.dart';
import 'package:guided_traveler/models/offers.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class foodGrid extends StatefulWidget {
  @override
  State<foodGrid> createState() => _foodGridState();
}

class _foodGridState extends State<foodGrid> {
  final List<Food> food = [
    Food(
        id: 1,
        foodName: "Achcharu",
        foodPrice: "250.00",
        foodImg: "achcharu.jpg"),
    Food(
        id: 2, foodName: "Hoppers", foodPrice: '50.00', foodImg: "Hoppers.jpg"),
    Food(
        id: 3,
        foodName: 'Rice and Curry',
        foodPrice: '450.00',
        foodImg: "rice.jpg"),
    Food(id: 4, foodName: "Kottu", foodPrice: "890.00", foodImg: "kottu.jpg"),
    Food(
        id: 5,
        foodName: "Jaffna Crab Curry",
        foodPrice: "1490.00",
        foodImg: "Crab.jpg"),
    Food(id: 6, foodName: "Roti", foodPrice: "390.00", foodImg: "roti.jpg"),
    Food(
        id: 7,
        foodName: "Polos (green jackfruit curry)",
        foodPrice: "",
        foodImg: "polos.jpg"),
    Food(
        id: 8,
        foodName: "Kukul mas curry (chicken curry)",
        foodPrice: "",
        foodImg: "mas.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'Sri Lanka Special Foods',
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
          itemCount: food.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Card(
                color: const Color.fromRGBO(229, 248, 252, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: Size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(
                                  "${AssetConstants.visitPlacesPath}${food[index].foodImg}"),
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                food[index].foodName,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              CustomText(
                                'RS.' + food[index].foodPrice,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
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
  }
}
