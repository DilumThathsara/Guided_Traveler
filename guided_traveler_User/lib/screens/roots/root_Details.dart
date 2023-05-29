import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/root.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';

class rootDetails extends StatefulWidget {
  const rootDetails({super.key});

  @override
  State<rootDetails> createState() => _rootDetailsState();
}

class _rootDetailsState extends State<rootDetails> {
  final List<Root> root = [
    Root(
        id: 1,
        rootName: "Polonnaruwa and Sigiriya tours",
        rootDes: "1.Minneriya or Kaudulla National Parks",
        rootImg: "root.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const CustomText(
              "Polonnaruwa and Sigiriya ",
              fontSize: 24,
              color: Colors.white,
            ),
            elevation: 10.0,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Container(
                width: 400,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetConstants.roots),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetConstants.stars,
                    // width: 109,
                    // height: 65,
                    scale: 4,
                  ),
                  const SizedBox(width: 90),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up),
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    iconSize: 40,
                  )
                ],
              ),
              const CustomText(
                "1.Minneriya or Kaudulla National Parks\n 2.Parakrama Samudraya (Sea of Parakrama)",
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
