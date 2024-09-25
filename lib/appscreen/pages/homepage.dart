import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:iconsax/iconsax.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidresponse/appscreen/pages/sos.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LatLng? picklocation;
  // loc.Location location = loc.Location();

  String cooedinates = 'no';
  Location _locationcontroller = new Location();
  LatLng? _currentp = null;
  LatLng? volp = null;
  final _db = FirebaseDatabase.instance.ref().child('Volunteer/location');

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    fetchDataOnce();
    getlocalupdate();
  }

  sigout() async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar('Success', 'Logged Out Successfully',
        backgroundColor: Colors.deepPurple.withOpacity(0.1),
        colorText: Colors.deepPurple,
        snackPosition: SnackPosition.TOP);
  }

  void fetchDataOnce() async {
    try {
      DatabaseEvent event = await _db.once();
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          double latitude = data['latitude'];
          double longitude = data['longitude'];
          volp = LatLng(latitude, longitude);
        });
      }
      print(volp);
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  Future<void> getlocalupdate() async {
    bool serviceenabled;
    PermissionStatus _persmision;
    serviceenabled = await _locationcontroller.serviceEnabled();
    if (serviceenabled) {
      serviceenabled = await _locationcontroller.requestService();
    } else {
      return;
    }
    _persmision = await _locationcontroller.hasPermission();
    if (_persmision == PermissionStatus.denied) {
      _persmision = await _locationcontroller.requestPermission();
      if (_persmision != PermissionStatus.granted) {
        return;
      }
    }
    _locationcontroller.onLocationChanged
        .listen((LocationData currentlocation) {
      if (currentlocation.latitude != null &&
          currentlocation.longitude != null) {
        setState(() {
          _currentp =
              LatLng(currentlocation.latitude!, currentlocation.longitude!);
          //_cameratoposition(tig!);
          // print(_currentp);
        });
      }
    });
  }

  static const LatLng _kGooglePlex =
      LatLng(37.42796133580664, -122.085749655962);
  static const LatLng tig = LatLng(20.287090, 83.146606);

  // Future<void> _cameratoposition(LatLng pos) async {
  //   final GoogleMapController controller = await _controller.future;
  //   CameraPosition _newcampos = CameraPosition(target: pos, zoom: 13);

  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_newcampos));
  // }

  // void polyline() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = polylinePoints.getRouteBetweenCoordinates(googleApiKey: gooleapi,)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Sospage()));
          },
          child: Icon(
            Icons.emergency,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Text('Rapid Response'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Iconsax.search_normal),
            )
          ],
        ),
        body: _currentp == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: 500,
                    child: GoogleMap(
                      onMapCreated: (GoogleMapController controller) =>
                          _controller.complete(controller),
                      initialCameraPosition:
                          CameraPosition(zoom: 13, target: _currentp!),
                      markers: {
                        Marker(
                            markerId: const MarkerId('current'),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _currentp!),
                        if (volp != null)
                          Marker(
                              markerId: const MarkerId('volunteer'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: volp!),
                        const Marker(
                            markerId: MarkerId('vasourceue'),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _kGooglePlex)
                      },
                      mapType: MapType.normal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tools Location',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Image.asset(
                                  'assets/images/tools.png',
                                  height: 100,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Voluenteers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Image.asset(
                                  'assets/images/volunteer-icon-29234.png',
                                  height: 100,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Snake Catcher',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Image.asset(
                                  'assets/images/snake-png-3651.png',
                                  height: 100,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
