import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/providers/registration_provider.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/screens/auth/logIn.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:provider/provider.dart';

class driverRegisterForm extends StatefulWidget {
  const driverRegisterForm({super.key});

  @override
  State<driverRegisterForm> createState() => _driverRegisterFormState();
}

class _driverRegisterFormState extends State<driverRegisterForm> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phoneNo = TextEditingController();
  final _vehicleNo = TextEditingController();
  bool isChecked = false;

  List<Map> types = [
    {'id': 1, 'value': 'Bicycle'},
    {'id': 2, 'value': 'MotorBike'},
    {'id': 3, 'value': 'Three Wheel'},
    {'id': 4, 'value': 'Car'},
    {'id': 5, 'value': 'SUV'},
    {'id': 6, 'value': 'Van'},
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 10.0,
          leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(child: Consumer<registerProvider>(
          builder: (context, value, child) {
            return Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  'Driver Registration',
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText('Select Vehicle Photo',
                    color: Colors.black, fontSize: 20),
                const SizedBox(height: 20),
                Consumer<registerProvider>(
                  builder: (context, value, child) {
                    return value.image.path == ""
                        ? IconButton(
                            onPressed: () => value.selectImage(),
                            icon: const Icon(
                              Icons.image,
                              size: 60,
                            ),
                          )
                        : InkWell(
                            onTap: () => value.selectImage(),
                            child: Image.file(
                              value.image,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                  },
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: Provider.of<registerProvider>(context)
                      .vehicleNameController,
                  hintText: 'Name',
                  labelText: 'Name',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: Provider.of<registerProvider>(context)
                      .vehicleEmailController,
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: Provider.of<registerProvider>(context)
                      .vehiclePhoneNoController,
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: Provider.of<registerProvider>(context)
                      .vehicleNoController,
                  hintText: 'Vehicle Number',
                  labelText: 'Vehicle Number',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const CustomText(
                      'With Driver',
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.amber,
                      onChanged: (cValue) {
                        value.setwithDriver = cValue!;
                      },
                    ),
                    const CustomText(
                      'With out Driver',
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    Checkbox(
                      value: isChecked,
                      activeColor: AppColors.primaryColor,
                      onChanged: (cValue) {
                        value.setwithOutDriver = cValue!;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const CustomText(
                      'Select Vehicle Type :',
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Consumer<registerProvider>(
                      builder: (context, value, child) {
                        return DropdownButtonFormField(
                          // Initial Value
                          value: selectedValue,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          hint: const CustomText(
                            'What type will you select?',
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: types.map((items) {
                            return DropdownMenuItem(
                                value: items['value'].toString(),
                                child: Text(items['value']));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              value.setVehicleType = newValue!;
                            });
                          },
                        );
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 25),
                Consumer<registerProvider>(
                  builder: (context, value, child) {
                    return customButton(
                        onTap: () {
                          value.registerVehicle(context);
                          // AnimatedSnackBar.rectangle(
                          //   'Success',
                          //   'Vehicle registration is success',
                          //   type: AnimatedSnackBarType.success,
                          //   brightness: Brightness.dark,
                          // ).show(
                          //   context,
                          // );
                        },
                        text: 'Submit');
                  },
                )
              ],
            );
          },
        )),
      ),
    );
  }
}
