import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/hotelRegister_provider.dart';
import 'package:guided_traveler/providers/hotelRegister_provider.dart';
import 'package:guided_traveler/providers/hotelRegister_provider.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class HotelRegisterForm extends StatefulWidget {
  const HotelRegisterForm({super.key});

  @override
  State<HotelRegisterForm> createState() => _HotelRegisterFormState();
}

class _HotelRegisterFormState extends State<HotelRegisterForm> {
  bool isChecked = false;

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
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(child: Consumer<hotelRegisterProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                const CustomText(
                  'Hotel Registration',
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText('Select Hotel Photo',
                    color: Colors.black, fontSize: 20),
                const SizedBox(height: 20),
                Consumer<hotelRegisterProvider>(
                  builder: (context, value, child) {
                    return value.hotelImage.path == ""
                        ? IconButton(
                            onPressed: () => value.selectHotelImage(),
                            icon: const Icon(
                              Icons.image,
                              size: 60,
                            ),
                          )
                        : InkWell(
                            onTap: () => value.selectHotelImage(),
                            child: Image.file(
                              value.hotelImage,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                  },
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelNameController,
                  hintText: 'Hotel Name',
                  labelText: 'Hotel Name',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelEmailController,
                  hintText: 'Hotel email',
                  labelText: 'Hotel email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelPhoneNoController,
                  hintText: 'Hotel Phone Number',
                  labelText: 'Hotel Phone Number',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelRoomPriceController,
                  hintText: 'Hotel Room Price',
                  labelText: 'Hotel Room Price',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelLocationController,
                  hintText: 'Hotel Location',
                  labelText: 'Hotel Location',
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: Provider.of<hotelRegisterProvider>(context)
                      .hotelDescriptionController,
                  decoration: InputDecoration(
                    labelText: 'Enter Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),

                  keyboardType: TextInputType.multiline,
                  minLines: 1, // <-- SEE HERE
                  maxLines: 15, // <-- SEE HERE
                ),
                const SizedBox(height: 20),
                Consumer<hotelRegisterProvider>(
                  builder: (context, value, child) {
                    return customButton(
                        onTap: () {
                          value.registerHotel();
                          AnimatedSnackBar.rectangle(
                            'Success',
                            'Hotel registration is success',
                            type: AnimatedSnackBarType.success,
                            brightness: Brightness.dark,
                          ).show(
                            context,
                          );
                        },
                        text: 'Add Hotel Details');
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
