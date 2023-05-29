import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class emergencyGrid extends StatelessWidget {
  emergencyGrid({super.key});

  final emergencyName = [
    'Police',
    'Ambulance',
    'Tourist Police',
    'Report Crimes',
  ];

  final emergencyNumber = [
    '119/118',
    '110/1990',
    '011-2421052',
    '011-2691500',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'Emergency',
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
          itemCount: emergencyName.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                color: const Color.fromRGBO(229, 248, 252, 1),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              emergencyName[index],
                              fontSize: 25,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
                            CustomText(
                              emergencyNumber[index],
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.call))
                          ],
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
