import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/providers/driver_Provider.dart';
import 'package:guided_traveler/providers/hotelBooking_Provider.dart';
import 'package:guided_traveler/providers/withDriverBooking_Provider.dart';
import 'package:guided_traveler/providers/withOutDriverBooking_Provider..dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class withOutDriverVehicleBookingForm extends StatefulWidget {
  const withOutDriverVehicleBookingForm({super.key});

  @override
  State<withOutDriverVehicleBookingForm> createState() =>
      _withOutDriverVehicleBookingFormState();
}

class _withOutDriverVehicleBookingFormState
    extends State<withOutDriverVehicleBookingForm> {
  final _vehicleCustomerPhoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: const CustomText(
                'Vehicle Booking Form',
                fontSize: 24,
                color: AppColors.white,
              ),
              elevation: 1.0,
              leading: IconButton(
                onPressed: () {
                  utillFunction.goBack(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              )),
          body: Consumer<WithOutDriverBookingProvider>(
            builder: (context, value, child) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: Provider.of<WithOutDriverBookingProvider>(
                              context,
                              listen: false)
                          .withOutDriverCustomerPickUpLocationController,
                      hintText: 'Pick up Location',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: Provider.of<WithOutDriverBookingProvider>(
                              context,
                              listen: false)
                          .withOutDriverCustomerPhoneNoController,
                      hintText: 'Whatsapp Number',
                    ),
                    TextField(
                      controller: Provider.of<WithOutDriverBookingProvider>(
                              context,
                              listen: false)
                          .withOutDriverCustomerPickUp,
                      //editing controller of this TextField
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Pick Up" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            Provider.of<WithOutDriverBookingProvider>(context,
                                        listen: false)
                                    .withOutDriverCustomerPickUp
                                    .text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: Provider.of<WithOutDriverBookingProvider>(
                              context,
                              listen: false)
                          .withOutDriverCustomerPickOut, //editing controller of this TextField
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Pick Out" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            Provider.of<WithOutDriverBookingProvider>(context,
                                        listen: false)
                                    .withOutDriverCustomerPickOut
                                    .text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Consumer<userProvider>(
                      builder: (context, Usvalue, child) {
                        return Consumer<DriverProvider>(
                          builder: (context, Hvalue, child) {
                            return customButton(
                                isLoading: Usvalue.isLoading,
                                onTap: () {
                                  value.stratSavewithOutDriverVehicleBooking(
                                      Usvalue.userModel!.uid,
                                      Usvalue.userModel!.name,
                                      Usvalue.userModel!.email,
                                      Hvalue.getWithOutDriverModel.vehicleName,
                                      Hvalue.getWithOutDriverModel.vehicleEmail,
                                      Hvalue.getWithDriverModel.vehicleNo,
                                      context);
                                },
                                text: 'Booking vehicle');
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
