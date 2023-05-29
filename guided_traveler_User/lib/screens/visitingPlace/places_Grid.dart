import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/place.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class placesGrid extends StatefulWidget {
  @override
  _placesGridState createState() => _placesGridState();
}

class _placesGridState extends State<placesGrid> {
  List<int> selectedIndices = [];

  List<Place> places = [
    Place(id: 1, title: "aaa", placeImgUrl: "1.jpg", height: 240),
    Place(id: 2, title: "bbb", placeImgUrl: "2.jpg", height: 200),
    Place(id: 3, title: "ccc", placeImgUrl: "3.jpeg", height: 120)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              'Visiting Places',
              fontSize: 24,
              color: Colors.white,
            ),
            elevation: 1.0,
            leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            //shrinkWrap: true,
            //itemCount:10,
            itemCount: places.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 240,
                  width: 200,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(15),
                  //   image: const DecorationImage(
                  //       image: AssetImage(
                  //           "${AssetConstants.visitPlacesPath}${places[index].placeImgUrl}"),
                  //       fit: BoxFit.cover),
                  // ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          CustomText(
                            "",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
