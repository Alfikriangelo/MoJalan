import "package:flutter/material.dart";
import "package:mojalan/model/tourguide_model.dart";
import "package:mojalan/utilities/colors.dart";
import 'package:intl/intl.dart';
import "package:mojalan/screens/booking/booking.dart";

class DetailsTourguides extends StatefulWidget {
  final TourGuideInfo tourGuideInfo;
  const DetailsTourguides({Key? key, required this.tourGuideInfo})
      : super(key: key);

  @override
  State<DetailsTourguides> createState() => _DetailsTourguidesState();
}

class _DetailsTourguidesState extends State<DetailsTourguides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pemandu")),
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.asset(
            widget.tourGuideInfo.image,
            width: double.infinity,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.tourGuideInfo.name,
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.tourGuideInfo.rating.toString(),
                                    style: TextStyle(fontSize: 23),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.asset(
                                      "assets/icons/star.png",
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 5),
                                    child: Text(
                                      widget.tourGuideInfo.verified,
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/verify.png",
                                    color: Colors.green,
                                    height: 18,
                                    width: 18,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    widget.tourGuideInfo.place,
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Wrap(
                                spacing: 5,
                                children: [
                                  for (String expertise
                                      in widget.tourGuideInfo.expert)
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        expertise,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Halo, aku ${widget.tourGuideInfo.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              Text(
                                widget.tourGuideInfo.introduce,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Bahasa: ${widget.tourGuideInfo.language.join(', ')}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Color.fromARGB(255, 87, 111, 227)),
                              ),
                              Text(
                                "Harga: Rp${NumberFormat('#,###', 'id_ID').format(widget.tourGuideInfo.price)} / Hari",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: const Color.fromARGB(
                                        255, 126, 224, 129)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Wrap(
                                  spacing: 5,
                                  children: [
                                    for (String imagePath
                                        in widget.tourGuideInfo.experience)
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            imagePath,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 50), // Lebar penuh dan tinggi 50
                    foregroundColor: whiteColor,
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Booking(
                                  tourGuideInfo: widget.tourGuideInfo,
                                )));
                  },
                  child: Text(
                    'Pilih',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
