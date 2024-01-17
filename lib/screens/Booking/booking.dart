// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mojalan/model/tourguide_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mojalan/screens/Home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:mojalan/utilities/colors.dart";

class Booking extends StatefulWidget {
  final TourGuideInfo tourGuideInfo;

  const Booking({Key? key, required this.tourGuideInfo}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  LatLng markerLocation = LatLng(-8.713058466453584, 115.16771384904149);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                    center: markerLocation,
                    zoom: 19,
                    onPositionChanged: (MapPosition position, bool hasGesture) {
                      // Mengupdate posisi marker saat peta digeser
                      setState(() {
                        markerLocation = position.center as LatLng;
                      });
                    }),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(markers: [
                    Marker(
                      point: markerLocation,
                      child: Icon(
                        Icons.location_on,
                        color: primaryColor,
                      ),
                    ),
                  ]),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () =>
                            _launchUrl('https://openstreetmap.org/copyright'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Berapa hari?',
                        floatingLabelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
                  child: Text(
                    "Harga: Rp${NumberFormat('#,###', 'id_ID').format(widget.tourGuideInfo.price)} / Hari",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    foregroundColor: whiteColor,
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text(
                    'Pesan',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
