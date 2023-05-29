import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WithDriverCustomerController {
  //---save the  data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withDriverCustomer =
      FirebaseFirestore.instance.collection('withDriverVehicleBookingDetails');

  Stream<QuerySnapshot> getBookings(String email) =>
      withDriverCustomer.where("email", isEqualTo: email).snapshots();

  //---fetch withDriver customer list from cloudfirestore
  Future<List<withDriverCustomerModel>> fetchWithDriverCustomerList(
      BuildContext context) async {
    try {
      //----------------firebase query that find and fetch WithDriver collection
      QuerySnapshot querySnapshot = await withDriverCustomer
          .where('email',
              isEqualTo: Provider.of<userProvider>(context, listen: false)
                  .userModel!
                  .email)
          .get();
      Logger().i(querySnapshot.docs.length);

      //---temp driver customer list
      List<withDriverCustomerModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping driver data in to driver modul
        withDriverCustomerModel model =
            withDriverCustomerModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the driver list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
