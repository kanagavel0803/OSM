import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'user_navbar1.dart';
import 'user_vehicle.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(11.1271, 78.6569);
  Marker? _selectedMarker;
  String cityName = "Unknown";
  LatLng? _markerPosition;
  bool _showCustomInfoWindow = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCityName(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      setState(() {
        cityName = placemarks[0].locality ?? "Unknown";
      });
    } catch (e) {
      print(e);
      setState(() {
        cityName = "Error getting city name";
      });
    }
  }

  void _addMarker(LatLng position) async {
    await _getCityName(position);
    setState(() {
      _markerPosition = position;
      _selectedMarker = Marker(
        markerId: MarkerId('selected_marker'),
        position: position,
        infoWindow: InfoWindow(
          title: cityName,
          snippet: 'Confirm Location',
          onTap: () {
            setState(() {
              _showCustomInfoWindow = true;
            });
          },
        ),
      );
    });
  }

  void _onDoubleTap(LatLng position) {
    _addMarker(position);
  }

  void _searchAndNavigate(String searchText) async {
    try {
      List<Location> locations = await locationFromAddress(searchText);
      if (locations.isNotEmpty) {
        mapController?.animateCamera(CameraUpdate.newLatLng(
          LatLng(locations[0].latitude, locations[0].longitude),
        ));
      }
    } catch (e) {
      print("Error searching: $e");
    }
  }

  void _navigateToUserVehicle() {
    if (_markerPosition != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserVehicle(
            confirmedLocation: '${_markerPosition!.latitude}, ${_markerPosition!.longitude}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar1(),
      appBar: AppBar(
        title: Text('Google Map'),
        backgroundColor: Color.fromARGB(255, 31, 157, 161),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: _selectedMarker != null ? {_selectedMarker!} : {},
            onTap: _onDoubleTap,
          ),
          if (_showCustomInfoWindow && _markerPosition != null)
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 50,
              left: MediaQuery.of(context).size.width / 2 - 75,
              child: CustomInfoWindow(
                cityName: cityName,
                onConfirm: () {
                  _navigateToUserVehicle();
                },
              ),
            ),
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,  // Changed to white
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),  // Changed to gray
                  SizedBox(width: 12.0),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),  // Changed to gray
                      ),
                      style: TextStyle(color: Colors.black),  // Changed to black for better readability
                      onChanged: (value) {
                        _searchAndNavigate(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                onPressed: _navigateToUserVehicle,
                child: Text('Go'),
                backgroundColor: Color.fromARGB(255, 31, 157, 161),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  UserVehicle({required String confirmedLocation}) {}
}

class CustomInfoWindow extends StatelessWidget {
  final String cityName;
  final VoidCallback onConfirm;

  CustomInfoWindow({required this.cityName, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 31, 157, 161),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cityName,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              'Confirm',
              style: TextStyle(color: Color.fromARGB(255, 14, 12, 12)),
              
            ),
   style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              side: BorderSide(color: Color.fromARGB(255, 83, 64, 155)),
            ),
          ),

          
        ],
      ),
    );
  }
}
