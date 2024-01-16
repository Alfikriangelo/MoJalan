import "package:flutter/material.dart";
import "package:mojalan/model/tourguide_model.dart";
import "package:mojalan/utilities/colors.dart";

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
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back,
                              color: blackColor,
                              size: 20,
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Pemandu",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ))
                    ],
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: SingleChildScrollView(
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
                                Text(widget.tourGuideInfo.rating.toString()),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(
                                    "assets/icons/star.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: Text(widget.tourGuideInfo.verified),
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
                                Text(widget.tourGuideInfo.place),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              spacing:
                                  5, // Adjust the spacing between items as needed
                              children: [
                                for (String expertise
                                    in widget.tourGuideInfo.expert)
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      expertise,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Halo, aku ${widget.tourGuideInfo.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Text(
                              widget.tourGuideInfo.introduce,
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Wrap(
                                spacing:
                                    5, // Adjust the spacing between items as needed
                                children: [
                                  for (String imagePath
                                      in widget.tourGuideInfo.experience)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10), // Adjust the border radius as needed
                                      child: Image.asset(
                                        imagePath,
                                        height:
                                            100, // Adjust the height as needed
                                        width:
                                            100, // Adjust the width as needed
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
