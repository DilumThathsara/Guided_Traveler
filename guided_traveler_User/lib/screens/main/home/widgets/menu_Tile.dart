import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/models/menu.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class menuTile extends StatelessWidget {
  const menuTile({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        utillFunction.navigateTo(context, menu.widget);
      },
      child: Container(
        height: 177,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(229, 248, 252, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "${AssetConstants.menuIconPath}${menu.categoryLogo}",
                scale: 7,
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
            ),
            Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 9),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  menu.categoryNmae,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
