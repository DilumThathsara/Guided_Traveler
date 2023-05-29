import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/offers.dart';
import 'package:guided_traveler/screens/offers/offer_Details.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class OfferGrid extends StatefulWidget {
  @override
  State<OfferGrid> createState() => _OfferGridState();
}

class _OfferGridState extends State<OfferGrid> {
  final List<Offer> offer = [
    Offer(
        id: 1,
        offerTitle: "Ella Odyssey Special train",
        offerPrice: "15.49",
        offerImg: "5.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'Offers',
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
          itemCount: offer.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  utillFunction.navigateTo(context, offerDetails());
                },
                child: Card(
                  color: const Color.fromRGBO(229, 248, 252, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: Size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage(
                                    "${AssetConstants.visitPlacesPath}${offer[index].offerImg}"),
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
                                  offer[index].offerTitle,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  offer[index].offerPrice,
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
            );
          }),
        ),
      ),
    );
  }
}
