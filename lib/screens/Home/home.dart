import 'package:flutter/material.dart';
import 'package:mojalan/model/place_model.dart';
import 'package:mojalan/model/tourguide_model.dart';
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
                                    press: () {},
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
                    height: tourguides.length * 210.0,
                    child: ListView.builder(
                      itemCount: tourguides.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding:
                          const EdgeInsets.only(bottom: 20), // Tambahkan ini
                      itemBuilder: (context, index) {
                        return RecommendedTourGuidesCard(
                          tourGuideInfo: tourguides[index],
                          press: () {},
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

class RecommendedTourGuidesCard extends StatelessWidget {
  final TourGuideInfo tourGuideInfo;
  final VoidCallback press;

  const RecommendedTourGuidesCard({
    super.key,
    required this.tourGuideInfo,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 134,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // Bagian Gambar (1/4 dari lebar container)
                      Container(
                        width: 190, // 1/4 dari lebar container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            tourGuideInfo.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Bagian Nama (mengambil sisa lebar)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tourGuideInfo.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tourGuideInfo.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/icons/star.png", // Menggunakan `Image.asset` untuk asset lokal
                                      height:
                                          18, // Sesuaikan tinggi gambar sesuai kebutuhan
                                      width:
                                          18, // Sesuaikan lebar gambar sesuai kebutuhan
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedPlacesCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;
  const RecommendedPlacesCard({
    super.key,
    required this.placeInfo,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 210,
        width: 200,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(placeInfo.image),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    placeInfo.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
