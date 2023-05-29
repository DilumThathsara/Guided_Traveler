import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/models/hotelCustomer_model.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HotelCustomerController {
  //---save the  data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference hotelCustomer =
      FirebaseFirestore.instance.collection('hotelBookingDetails');

  Stream<QuerySnapshot> getBookings(String email) =>
      hotelCustomer.where("hotelEmail", isEqualTo: email).snapshots();

  //---fetch hotel customer list from cloudfirestore
  Future<List<hotelCustomerModel>> fetchWithHotelCustomerList(
      BuildContext context) async {
    try {
      //----------------firebase query that find and fetch hotel collection
      QuerySnapshot querySnapshot = await hotelCustomer
          .where('hotelEmail',
              isEqualTo: Provider.of<userProvider>(context, listen: false)
                  .userModel!
                  .email)
          .get();
      Logger().i(querySnapshot.docs.length);

      //---temp hotel customer list
      List<hotelCustomerModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping driver data in to hotel modul
        hotelCustomerModel model =
            hotelCustomerModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the hotel list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<void> deleteBooking(
    String uid,
  ) async {
    hotelCustomer.doc(uid).delete();
  }
}
