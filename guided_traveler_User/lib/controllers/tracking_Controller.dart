import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class TrackingController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// Create a CollectionReference called users that references the firestore collection
  CollectionReference map = FirebaseFirestore.instance.collection('Map');

// Create a CollectionReference called users that references the firestore collection
// CollectionReference organizers =
//     FirebaseFirestore.instance.collection('user');
  CollectionReference trackUser =
      FirebaseFirestore.instance.collection('trackingDetails');
  late DocumentReference _documentReference;
  late CollectionReference _collectionReference;

  Future<void> saveTrackingDetails(
    UserModel user,
    String latitude,
    String longitude,
  ) async {
    await map.doc(user.uid).set({
      'user': user.toJson(),
    });
    _documentReference = map.doc(user.uid);
    _collectionReference = _documentReference.collection('trackingDetails');
    _collectionReference.add(
      {
        'latitude': latitude,
        'longitude': longitude,
        'date': DateTime.now(),
      },
    ).then((value) {
      trackUser.add(
        {
          'latitude': latitude,
          'longitude': longitude,
          'date': DateTime.now(),
        },
      );
    });
  }
}
