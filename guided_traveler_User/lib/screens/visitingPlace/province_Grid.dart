import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/screens/visitingPlace/province/Uva_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/central_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/eastern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northCentral_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northWestern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/northern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/sabaragamuwa_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/southern_Province.dart';
import 'package:guided_traveler/screens/visitingPlace/province/western_Province.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class provinceGrid extends StatelessWidget {
  const provinceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const CustomText(
            'Provinces',
            fontSize: 24,
            color: Colors.white,
          ),
          elevation: 10.0,
          leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, centralProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://media-cdn.tripadvisor.com/media/photo-s/16/de/2c/bc/sri-dalada-maligawa-or.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Central',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, easternProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/b0/6f/8a/caption.jpg?w=300&h=300&s=1',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Eastern',
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, northernProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.attractionsinsrilanka.com/wp-content/uploads/2020/05/Nallur-Kandaswamy-Temple-Nallur-Kovil1.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Northern',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, southernProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/10/4f/42/photo1jpg.jpg?w=500&h=-1&s=1',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Southern',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, westernProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.dailynews.lk/sites/default/files/news/2022/09/14/1-15.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Western',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, northWesternProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://i.ytimg.com/vi/SWsVQs8FfgM/maxresdefault.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'North Western',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, northCentralProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.dailynews.lk/sites/default/files/news/2022/06/15/Untitled-28.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'North Central',
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, UvaProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.ourhoneymoondestinations.com/wp-content/uploads/2017/05/train-2315520_1920.jpg',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Uva ',
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      utillFunction.navigateTo(context, sabaragamuwaProvince());
                    },
                    child: Container(
                      width: 220,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://cdn.shopify.com/s/files/1/1762/3971/files/LK94009592-11-E.jpg?v=1660620149&width=1500',
                            )),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: const [
                            CustomText(
                              'Sabaragamuwa',
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
