import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:montirku_v1/views/user_client/home/fnearby/const.dart';

class MapPages extends StatefulWidget {
  const MapPages({super.key});

  @override
  State<MapPages> createState() => _MapPagesState();
}

class _MapPagesState extends State<MapPages> {
  static const LatLng _pGooglePlex =
      LatLng(-6.965576641298509, 107.62678923541813);
  static const LatLng _pApplePark =
      LatLng(-6.971038117282299, 107.63663955503716);
  static const LatLng _pMargaCinta1 =
      LatLng(-6.954453583321425, 107.64677228539117);
  static const LatLng _pMargaCinta2 =
      LatLng(-6.954310947582422, 107.6369373047518);
  static const LatLng _pMargaCinta3 =
      LatLng(-6.967779555849087, 107.64084780002631);
  static const LatLng _pMargaCinta4 =
      LatLng(-6.978649666892345, 107.63217624175529);
  LatLng? _currentP;
  final Location _locationsController = Location();
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8FCFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _currentP == null
          ? const Center(child: Text('Loading...'))
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  mapController.complete(controller)),
              initialCameraPosition: const CameraPosition(target: _pGooglePlex),
              markers: {
                Marker(
                  markerId: const MarkerId("_currentLocation"),
                  position: _currentP!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                ),
                const Marker(
                  markerId: MarkerId("_sourceLocation"),
                  position: _pGooglePlex,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                const Marker(
                  markerId: MarkerId("_destinationLocation"),
                  position: _pApplePark,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                const Marker(
                  markerId: MarkerId("_destinationLocation1"),
                  position: _pMargaCinta1,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                const Marker(
                  markerId: MarkerId("_destinationLocation2"),
                  position: _pMargaCinta2,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                const Marker(
                  markerId: MarkerId("_destinationLocation3"),
                  position: _pMargaCinta3,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                const Marker(
                  markerId: MarkerId("_destinationLocation4"),
                  position: _pMargaCinta4,
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _servicesEnable;
    PermissionStatus _permissionGranted;

    _servicesEnable = await _locationsController.serviceEnabled();
    if (_servicesEnable) {
      _servicesEnable = await _locationsController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationsController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationsController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationsController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
        PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }
}
