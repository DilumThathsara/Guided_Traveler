import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:guided_traveler/providers/hotelBooking_Provider.dart';
import 'package:guided_traveler/providers/hotel_Provider.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class hotelBookingForm extends StatefulWidget {
  const hotelBookingForm({super.key});

  @override
  State<hotelBookingForm> createState() => _hotelBookingFormState();
}

class _hotelBookingFormState extends State<hotelBookingForm> {
  TextEditingController dateinput = TextEditingController();
  final _hotelCustomerPhoneNo = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<HotelBookingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              title: const CustomText(
                'Hotel Booking Form',
                fontSize: 22,
                color: Colors.white,
              ),
              elevation: 10.0,
              leading: IconButton(
                  onPressed: () {
                    utillFunction.goBack(context);
                  },
                  icon: Icon(Icons.arrow_back))),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  CustomTextField(
                    controller: Provider.of<HotelBookingProvider>(context,
                            listen: false)
                        .customerPhoneNoController,
                    hintText: 'Customer Phone No',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: Provider.of<HotelBookingProvider>(context,
                            listen: false)
                        .customerCheckInController,
                    //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Check In" //label text of field
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
                          Provider.of<HotelBookingProvider>(context,
                                      listen: false)
                                  .customerCheckInController
                                  .text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: Provider.of<HotelBookingProvider>(context,
                            listen: false)
                        .customerCheckOutController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Check Out" //label text of field
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
                          Provider.of<HotelBookingProvider>(context,
                                      listen: false)
                                  .customerCheckOutController
                                  .text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: Provider.of<HotelBookingProvider>(context)
                        .NoOfGustController,
                    hintText: 'No Of Gust',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<userProvider>(
                    builder: (context, Usvalue, child) {
                      return Consumer<HotelProvider>(
                        builder: (context, Hvalue, child) {
                          return customButton(
                              isLoading: Usvalue.isLoading,
                              onTap: () {
                                value.stratSaveHotelBooking(
                                  Usvalue.userModel!.uid,
                                  Usvalue.userModel!.name,
                                  Usvalue.userModel!.email,
                                  Hvalue.gethotelModel.hotelEmail,
                                  Hvalue.gethotelModel.hotelName,
                                  context,
                                );
                              },
                              text: 'booking');
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
