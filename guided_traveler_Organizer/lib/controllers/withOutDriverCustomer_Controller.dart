import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/models/withOutDriverCustomer_model.dart';
import 'package:guided_traveler/providers/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WithOutDriverCustomerController {
  //---save the  data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withOutDriverCustomer = FirebaseFirestore.instance
      .collection('withOutDriverVehicleBookingDetails');

  Stream<QuerySnapshot> getBookings(String email) =>
      withOutDriverCustomer.where("vehicleEmail", isEqualTo: email).snapshots();

  //---fetch withDriver customer list from cloudfirestore
  Future<List<withOutDriverCustomerModel>> fetchWithOutDriverCustomerList(
      BuildContext context) async {
    try {
      //----------------firebase query that find and fetch WithOutDriver collection
      QuerySnapshot querySnapshot = await withOutDriverCustomer
          .where('vehicleEmail',
              isEqualTo: Provider.of<userProvider>(context, listen: false)
                  .userModel!
                  .email)
          .get();
      Logger().i(querySnapshot.docs.length);

      //---temp driver customer list
      List<withOutDriverCustomerModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping driver data in to driver modul
        withOutDriverCustomerModel model = withOutDriverCustomerModel
            .fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the driver list
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
    withOutDriverCustomer.doc(uid).delete();
  }
}
