import 'package:flutter/material.dart';
import 'package:location/location.dart';

Location location = Location();

// Getting device Location Widgets and functions

class MyLocation extends StatelessWidget {
  const MyLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLoc(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final locData = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(child: Text('Error Fetching Data!'));
            } else {
              return buildLocationInfo(locData);
            }
        }
      },
    );
  }

// Widget to display Lat and Lon. For debuging, not used in final product

  Widget buildLocationInfo(LocationData locData) => SafeArea(
        child: Container(
          color: Colors.blueGrey.withOpacity(.8),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Latitude: ${locData.latitude}, Longitude: ${locData.longitude}",
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );

// Checking Location permissions and status and returning Lat & Lon

  Future<LocationData> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception('Please enable Location Services');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception('Please Enable location Permissions');
      }
    }

    return await location.getLocation();
  }
}
