import "package:flutter/material.dart";
import "package:mojalan/model/tourguide_model.dart";
import "package:mojalan/utilities/colors.dart";

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
    return InkWell(
      onTap: press,
      child: Material(
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tourGuideInfo.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: primaryColor,
                                    ),
                                    Flexible(
                                      child: Text(
                                        tourGuideInfo.place,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                        ),
                                        overflow: TextOverflow
                                            .ellipsis, // Jika teks terlalu panjang, tampilkan titik-titik elipsis
                                      ),
                                    ),
                                  ],
                                )
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
