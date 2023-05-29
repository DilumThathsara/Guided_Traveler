import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/providers/location_Provider.dart';
import 'package:provider/provider.dart';
//import 'package:background_location/background_location.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  void initState() {
    super.initState();
    trackingUser();
  }

  void trackingUser() async {
    String lat = await Provider.of<LocationProvider>(context, listen: false)
            .getCurrenlatitude() ??
        '';

    String lon = await Provider.of<LocationProvider>(context, listen: false)
            .getCurrenlongitude() ??
        '';

    Timer mytimer = Timer.periodic(Duration(seconds: 30), (timer) {
      Provider.of<LocationProvider>(context, listen: false)
          .trackingCustomer(lat.toString(), lon.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer<LocationProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Get Current device location",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "latitude : ${value.position?.latitude}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "longitude : ${value.position?.longitude}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        },
      )),
    );
  }
}
