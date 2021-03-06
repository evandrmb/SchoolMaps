import 'package:aprotas/models/school.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  Position myLastPosition;

  List<LatLng> _createPoints(Position currentLocation, LatLng coords) {
    final List<LatLng> points = <LatLng>[
      LatLng(currentLocation.latitude, currentLocation.longitude),
      coords
    ];

    return points;
  }

  void _add(Position currentLocation, LatLng coords) {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red[200],
      width: 4,
      points: _createPoints(currentLocation, coords),
    );

    setState(() {
      _mapPolylines.clear();
      _mapPolylines[polylineId] = polyline;
    });
  }

  GoogleMapController _controller;

  List<Marker> allMarkers = [];
  @override
  void initState() {
    super.initState();
    theschools.map((sch) {
      allMarkers.add(
        Marker(
          onTap: () async {
            if (myLastPosition != null) _add(myLastPosition, sch.coords);
            var currentlocation = await Geolocator()
                .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
            myLastPosition = currentlocation;
            _add(currentlocation, sch.coords);
          },
          markerId: MarkerId(sch.name),
          draggable: false,
          infoWindow: InfoWindow(title: sch.name, snippet: sch.adress),
          position: sch.coords,
        ),
      );
    }).toList();
  }

  // void _getLocation() async {
  //   var currentLocation = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

  //   setState(() {
  //     final marker = Marker(
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
  //       markerId: MarkerId("user_location"),
  //       position: LatLng(currentLocation.latitude, currentLocation.longitude),
  //       infoWindow: InfoWindow(title: 'You was here'),
  //     );
  //     allMarkers.add(marker);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getLocation,
      //   tooltip: 'Get Location',
      //   child: Icon(Icons.flag),
      // ),
      appBar: AppBar(
        title: Text('School Routes'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: GoogleMap(
              polylines: Set<Polyline>.of(_mapPolylines.values),
              myLocationEnabled: true,
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
              initialCameraPosition: CameraPosition(
                  target: LatLng(-5.0891700, -42.8019400), zoom: 12),
            ),
          ),
        ],
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
