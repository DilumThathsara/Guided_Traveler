import 'package:flutter/material.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/admin/admin_provider.dart';
import 'package:guided_traveler/screens/auth/logIn.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:provider/provider.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 229, 229, 229),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                'Admin - Save product info',
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 41,
              ),
              Consumer<AdminProvider>(
                builder: (context, value, child) {
                  return value.image.path == ""
                      ? IconButton(
                          onPressed: () => value.selectImage(),
                          icon: const Icon(
                            Icons.image,
                            size: 60,
                          ))
                      : InkWell(
                          onTap: () => value.selectImage(),
                          child: Image.file(
                            value.image,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: Provider.of<AdminProvider>(context)
                    .visitingPlaceNameController,
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller: Provider.of<AdminProvider>(context).deseController,
                hintText: 'Description',
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<AdminProvider>(
                builder: (context, value, child) {
                  return customButton(
                    isLoading: value.isLoading,
                    onTap: () {
                      value.stratSavePlaceData();
                    },
                    text: 'save product',
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
