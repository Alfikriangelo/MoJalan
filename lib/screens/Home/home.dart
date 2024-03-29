import 'package:flutter/material.dart';
import 'package:mojalan/api/api_service.dart';
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
        // Hiding the keyboard when tapping outside TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 70,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "Halo",
                              style: TextStyle(color: blackColor, fontSize: 20),
                              children: [
                                TextSpan(
                                  text: ", Galih",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text(
                                  "Bali",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          )
                        ],
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
                  // Modify the FutureBuilder to fetch a list of places
                  FutureBuilder<List<PlaceInfo>>(
                    future: ApiService.fetchPlacesData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        List<PlaceInfo> places = snapshot.data!;

                        return Container(
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
                                            builder: (context) => DetailsPlaces(
                                              placeInfo: places[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: tourguides.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RecommendedTourGuidesCard(
                            tourGuideInfo: tourguides[index],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsTourguides(
                                    tourGuideInfo: tourguides[index],
                                  ),
                                ),
                              );
                            },
                          ),
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
