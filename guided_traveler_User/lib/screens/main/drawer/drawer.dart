import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/screens/main/home/home_page.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 20,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage("${AssetConstants.imagePath}user.jpg"),
                radius: 34,
              ),
            ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("${AssetsConstant.imagepath}farm.jpg"),
            //       fit: BoxFit.fill),
            // ),
            accountName: CustomText(
              'user',
              fontSize: 12,
              color: AppColors.white,
            ),
            accountEmail: CustomText(
              'user@gmail.com',
              fontSize: 12,
              color: AppColors.white,
            ),
          ),
          drawerContainer(context, 'Home',
              imgPath: AssetConstants.homePath, widget: const mainHomeScreen()),
          // drawerContainer(context, 'Q&A',
          //     imgPath: AssetsConstant.qaPath, widget: const QandAScreen()),
          // drawerContainer(context, 'FAQ',
          //     imgPath: AssetsConstant.faqPath, widget: const HomeScreen()),
          const Divider(
            color: Colors.black,
            endIndent: 20,
            indent: 20,
          ),
          drawerContainer(context, 'Setting',
              imgPath: AssetConstants.settingPath,
              widget: const mainHomeScreen()),
          const SizedBox(height: 300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: customButton(
                onTap: () {
                  AuthController.signOutUser();
                },
                text: 'Logout'),
          )
        ],
      ),
    );
  }

  //-------------custom container for drawer list
  InkWell drawerContainer(
    BuildContext context,
    String text, {
    required String imgPath,
    required Widget widget,
  }) {
    return InkWell(
      onTap: () {
        utillFunction.navigateTo(context, widget);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 3),

        // color: Colors.amber,
        child: Row(
          children: [
            Image.asset(
              imgPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: CustomText(
                text,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 90),
          ],
        ),
      ),
    );
  }
}
