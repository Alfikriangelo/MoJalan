class TourGuideInfo {
  final String name;
  final String image;
  final String place;
  final double rating;
  final String verified;
  final List<String> expert;
  final String introduce;
  final List<String> language;
  final int price;
  final List<String> experience;

  TourGuideInfo({
    required this.name,
    required this.image,
    required this.place,
    required this.rating,
    required this.verified,
    required this.expert,
    required this.introduce,
    required this.language,
    required this.price,
    required this.experience,
  });
}

List tourguides = [
  TourGuideInfo(
      name: "Budi Santoso",
      image: "assets/images/person1.jpg",
      place: "Jalan Legian, Bali, Indonesia",
      rating: 4.3,
      verified: "Terverifikasi",
      expert: ["Kota", "Budaya", "Sejarah"],
      introduce:
          "Sebagai tour guide yang penuh semangat. Dengan wawasan mendalam tentang sejarah dan budaya, saya menyajikan pengalaman wisata yang tak terlupakan. Keahlian komunikasi dan kehangatan saya membuat setiap perjalanan menjadi petualangan yang menyenangkan. Mari berkeliling bersama untuk menciptakan kenangan indah!",
      language: ["Indonesia, Inggris, Melayu, Jawa"],
      price: 350000,
      experience: [
        "assets/images/Kyoto-Japan.jpeg",
        "assets/images/nusapenida.jpg"
      ]),
  TourGuideInfo(
      name: "Ahmad Hidayat",
      image: "assets/images/person2.jpg",
      place: "Jalan Imam Bonjol, Bali, Indonesia",
      rating: 4.5,
      verified: "Terverifikasi",
      expert: ["Kota", "Budaya", "Sejarah"],
      introduce:
          "Sebagai tour guide yang penuh semangat. Dengan wawasan mendalam tentang sejarah dan budaya, saya menyajikan pengalaman wisata yang tak terlupakan. Keahlian komunikasi dan kehangatan saya membuat setiap perjalanan menjadi petualangan yang menyenangkan. Mari berkeliling bersama untuk menciptakan kenangan indah!",
      language: ["Indonesia, Inggris, Melayu, Jawa"],
      price: 350000,
      experience: [
        "assets/images/Kyoto-Japan.jpeg",
        "assets/images/nusapenida.jpg"
      ]),
  TourGuideInfo(
      name: "Fajar Pratama",
      image: "assets/images/person3.jpg",
      place: "Jalan Pangkung Sari, Bali, Indonesia",
      rating: 4.9,
      verified: "Terverifikasi",
      expert: ["Kota", "Budaya", "Sejarah"],
      introduce:
          "Sebagai tour guide yang penuh semangat. Dengan wawasan mendalam tentang sejarah dan budaya, saya menyajikan pengalaman wisata yang tak terlupakan. Keahlian komunikasi dan kehangatan saya membuat setiap perjalanan menjadi petualangan yang menyenangkan. Mari berkeliling bersama untuk menciptakan kenangan indah!",
      language: ["Indonesia, Inggris, Melayu, Jawa"],
      price: 350000,
      experience: [
        "assets/images/Kyoto-Japan.jpeg",
        "assets/images/nusapenida.jpg"
      ])
];
