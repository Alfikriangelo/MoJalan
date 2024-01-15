class TourGuideInfo {
  final String name;
  final String image;
  final String asal;
  final double rating;

  TourGuideInfo(
      {required this.name,
      required this.image,
      required this.asal,
      required this.rating});
}

List tourguides = [
  TourGuideInfo(
      name: "Budi Santoso",
      image: "assets/images/person1.jpg",
      asal: "Pekanbaru",
      rating: 4.3),
  TourGuideInfo(
      name: "Ahmad Hidayat",
      image: "assets/images/person2.jpg",
      asal: "Bali",
      rating: 4.5),
  TourGuideInfo(
      name: "Fajar Pratama",
      image: "assets/images/person3.jpg",
      asal: "Bali",
      rating: 4.9)
];
