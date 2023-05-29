import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/food.dart';
import 'package:guided_traveler/models/offers.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class northCentralProvince extends StatefulWidget {
  const northCentralProvince({Key? key}) : super(key: key);
  @override
  State<northCentralProvince> createState() => _northCentralProvinceState();
}

class _northCentralProvinceState extends State<northCentralProvince> {
  List items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle
        .loadString('assets/jsonFile/NorthCentralProvince.json');
    final data = await json.decode(response);
    setState(() {
      items = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'North Central Province',
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
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Card(
                  color: const Color.fromRGBO(229, 248, 252, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: Size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(items[index]["placeImage"]),
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
                                  items[index]["placeTile"],
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 700,
                          width: Size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(229, 248, 252, 1),
                              border: Border.all(
                                  width: 2, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: CustomText(
                            items[index]["placeDescription"],
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
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
