import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/screens/vehicleBooking/with_Driver.dart';
import 'package:logger/logger.dart';

class WithDriverBookingContoller {
  //---save the with driver booking data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called with Driver booking that references the firestore collection
  CollectionReference withDriverDetails =
      FirebaseFirestore.instance.collection('withDrivers');

  //---fetch with Driver vehicle list from cloudfirestore
  Future<List<withDriverModel>> fetchWithDriverList() async {
    try {
      //----------------firebase query that find and fetch with Driver vehicle collection
      QuerySnapshot querySnapshot = await withDriverDetails.get();
      Logger().i(querySnapshot.docs.length);

      //---temp with Driver vehicle list
      List<withDriverModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping with Driver vehicle data in to driver modul
        withDriverModel model =
            withDriverModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the with Driver vehicle list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //--- Create a CollectionReference called with Driver vehicle that references the firestore collection
  CollectionReference withDriverBookingDetails =
      FirebaseFirestore.instance.collection('withDriverVehicleBookingDetails');

  //----save extra with Driver vehicle data in firestore
  Future<void> saveWithDriverBooking(
      String withDriverCustomerPickUpLocation,
      String withDriverCustomerWhatsappNo,
      dynamic withDriverCustomerPickUp,
      dynamic withDriverCustomerPickOut,
      String uid,
      String name,
      String email,
      String vehicleName,
      String vehicleEmail,
      String vehicleNo) {
    String docId = withDriverBookingDetails.doc().id;
    return withDriverBookingDetails
        .doc(docId)
        .set(
          {
            'withDriverCustomerPickUpLocation':
                withDriverCustomerPickUpLocation,
            'withDriverCustomerWhatsappNo': withDriverCustomerWhatsappNo,
            'withDriverCustomerPickUp': withDriverCustomerPickUp,
            'withDriverCustomerPickOut': withDriverCustomerPickOut,
            'uid': uid,
            'name': name,
            'email': email,
            'vehicleName': vehicleName,
            'vehicleEmail': vehicleEmail,
            'vehicleNo': vehicleNo,
            'docId': docId,
          },
        )
        .then((value) => Logger().i("Successfully added"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }
}
