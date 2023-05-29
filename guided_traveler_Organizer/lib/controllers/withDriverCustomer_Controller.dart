import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WithDriverCustomerController {
  //---save the  data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withDriverCustomer =
      FirebaseFirestore.instance.collection('withDriverVehicleBookingDetails');

  Stream<QuerySnapshot> getBookings(String email) =>
      withDriverCustomer.where("vehicleEmail", isEqualTo: email).snapshots();

  //---fetch withDriver customer list from cloudfirestore
  Future<List<withDriverCustomerModel>> fetchWithDriverCustomerList(
      BuildContext context) async {
    try {
      //----------------firebase query that find and fetch WithDriver collection
      QuerySnapshot querySnapshot = await withDriverCustomer
          .where('vehicleEmail',
              isEqualTo: Provider.of<userProvider>(context, listen: false)
                  .userModel!
                  .email)
          .get();
      Logger().i(querySnapshot.docs.length);

      //---temp withDriver customer list
      List<withDriverCustomerModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping withDriver data in to driver modul
        withDriverCustomerModel model =
            withDriverCustomerModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the withDriver list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  // Future deleteData(String id) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("uid")
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection("withDriverVehicleBookingDetails")
  //         .doc(uid)
  //         .delete();
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<void> deleteWithDriver(
  //   String uid,
  // ) async {
  //   await withDriverVehicleBookingDetails.doc(uid).delete();
  // }
  Future<void> deleteBooking(
    String uid,
  ) async {
    withDriverCustomer.doc(uid).delete();
  }
}
