import 'package:flutter/material.dart';
import 'package:mojalan/model/place_model.dart';
import 'package:mojalan/model/tourguide_model.dart';
import 'package:mojalan/screens/Details/details_places.dart';
import 'package:mojalan/screens/Details/details_tourguide.dart';
import 'package:mojalan/screens/Home/widgets/recommended_places_cards.dart';
import 'package:mojalan/screens/Home/widgets/recommended_tourguide_cards.dart';
import 'package:mojalan/utilities/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Menyembunyikan keyboard saat mengetuk di luar TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/icons/home-active.png",
                      height: 30,
                      width: 30,
                      color: primaryColor,
                    ),
                    Text(
                      'Beranda',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icons/website.png",
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                    Text('Jelajah'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icons/planning.png",
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                    Text('Rencana'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icons/user.png",
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                    Text('Profil'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Halo",
                          style: TextStyle(color: blackColor, fontSize: 18),
                          children: [
                            TextSpan(
                              text: ", Galih",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: "Jalan kemana hari ini?",
                                  prefixIcon: Icon(Icons.search),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "Yang lagi rame nih!",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 220,
                      child: ListView.builder(
                          itemCount: places.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  RecommendedPlacesCard(
                                    placeInfo: places[index],
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsPlaces(
                                                    placeInfo: places[index],
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                            );
                          })),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rekomendasi Tour Guide",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: tourguides.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding:
                          const EdgeInsets.only(bottom: 20), // Tambahkan ini
                      itemBuilder: (context, index) {
                        return RecommendedTourGuidesCard(
                          tourGuideInfo: tourguides[index],
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsTourguides(
                                          tourGuideInfo: tourguides[index],
                                        )));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
