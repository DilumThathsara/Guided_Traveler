import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/notification_provider.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class nortificationGrid extends StatefulWidget {
  @override
  State<nortificationGrid> createState() => _nortificationGridState();
}

class _nortificationGridState extends State<nortificationGrid> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<NotificationProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              title: const CustomText(
                'Admin Massage',
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
            itemCount: value.notificatiosnModel.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: const Color.fromRGBO(229, 248, 252, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                value.notificatiosnModel[index].notiTopic,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                              CustomText(
                                "Special For: " +
                                    value.notificatiosnModel[index]
                                        .notiSpecialFor,
                                fontSize: 20,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                        CustomText(
                          value.notificatiosnModel[index].notiMassage,
                          fontSize: 20,
                          color: Colors.black,
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
    ));
  }
}
