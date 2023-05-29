import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/root.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class offerDetails extends StatefulWidget {
  const offerDetails({super.key});

  @override
  State<offerDetails> createState() => _offerDetailsState();
}

class _offerDetailsState extends State<offerDetails> {
  final List<Root> root = [
    Root(
        id: 1,
        rootName: "Ella Odyssey Special train",
        rootDes: "1.Minneriya or Kaudulla National Parks",
        rootImg: "5.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              "Ella Odyssey Special train",
              fontSize: 24,
              color: Colors.white,
            ),
            elevation: 10.0,
            leading: IconButton(
                onPressed: () {
                  utillFunction.goBack(context);
                },
                icon: const Icon(Icons.arrow_back))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Container(
                width: 450,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetConstants.offers),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Number of stops : 21 max \n Journey duration : 	10 hours 23 mins\n price : 15.49 \n\nRailway stations \n\n Horsetail Waterfall,Sri Pada (Adam's Peak) View	, St Clair Waterfall View, Elgin Falls View , Summit Level , No 18 Tunnel , Sulan Kapolla View , Kithal Ella Waterfall View , Nine Arches Bridge",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
