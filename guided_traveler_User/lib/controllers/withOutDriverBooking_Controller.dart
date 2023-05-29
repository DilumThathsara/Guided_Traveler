import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/models/without_driver_model.dart';
import 'package:guided_traveler/screens/vehicleBooking/with_Driver.dart';
import 'package:logger/logger.dart';

class WithOutDriverBookingContoller {
  //---save the withOut driver booking data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called withOut Driver booking that references the firestore collection
  CollectionReference withOutDriverDetails =
      FirebaseFirestore.instance.collection('withOutDrivers');

  //---fetch withOut Driver list from cloudfirestore
  Future<List<withOutDriverModel>> fetchWithOutDriverList() async {
    try {
      //----------------firebase query that find and fetch withOut Driver collection
      QuerySnapshot querySnapshot = await withOutDriverDetails.get();
      Logger().i(querySnapshot.docs.length);

      //---temp withOut Driver list
      List<withOutDriverModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping withOut Driver data in to driver modul
        withOutDriverModel model =
            withOutDriverModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the withOut Driver list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //--- Create a CollectionReference called without Driver vehicle that references the firestore collection
  CollectionReference withOutDriverBookingDetails = FirebaseFirestore.instance
      .collection('withOutDriverVehicleBookingDetails');

  //----save extra user data in firestore
  Future<void> saveWithOutDriverBooking(
    String withOutDriverCustomerPickUpLocation,
    String withOutDriverCustomerWhatsappNo,
    dynamic withOutDriverCustomerPickUp,
    dynamic withOutDriverCustomerPickOut,
    String uid,
    String name,
    String email,
    String vehicleName,
    String vehicleEmail,
    String vehicleNo,
  ) {
    String docId = withOutDriverBookingDetails.doc().id;
    return withOutDriverBookingDetails
        .doc(docId)
        .set(
          {
            'withOutDriverCustomerPickUpLocation':
                withOutDriverCustomerPickUpLocation,
            'withOutDriverCustomerWhatsappNo': withOutDriverCustomerWhatsappNo,
            'withOutDriverCustomerPickUp': withOutDriverCustomerPickUp,
            'withOutDriverCustomerPickOut': withOutDriverCustomerPickOut,
            'uid': uid,
            'name': name,
            'email': email,
            'vehicleName': vehicleName,
            'vehicleEmail': vehicleEmail,
            'vehicleNo': vehicleNo,
            'docId': docId
          },
        )
        .then((value) => Logger().i("Successfully added"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }
}
