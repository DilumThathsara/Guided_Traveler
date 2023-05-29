import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomText(
          'Profile',
          fontSize: 24,
          color: AppColors.white,
        ),
      ),
      body: SafeArea(child: Consumer<userProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
              const SizedBox(
                height: 122,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                value.userModel != null ? value.userModel!.name : "",
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomText(
                value.userModel != null ? value.userModel!.email : "",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff7085C3),
              ),
              const SizedBox(
                height: 120,
              ),
              customButton(
                  onTap: () {
                    AuthController.signOutUser();
                  },
                  text: "Logout"),
              const SizedBox(height: 20),
            ],
          );
        },
      )),
    );
  }
}
