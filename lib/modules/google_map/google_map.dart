import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDemo extends StatefulWidget {
  const MapDemo({super.key});

  @override
  State<MapDemo> createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(26.846695, 80.946167);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
