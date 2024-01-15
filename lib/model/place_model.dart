class PlaceInfo {
  final String location, image, name, desc;
  final int distance, days;

  PlaceInfo({
    required this.image,
    required this.name,
    required this.location,
    required this.distance,
    required this.days,
    required this.desc,
  });
}

List places = [
  PlaceInfo(
      image: "assets/images/borobudur.jpg",
      name: "Candi Borobudur",
      location: "Jawa Tengah",
      distance: 5000,
      days: 12,
      desc: "Salah satu candi terbesar di Indonesia"),
  PlaceInfo(
      image: "assets/images/nusapenida.jpg",
      name: "Nusa Penida",
      location: "Bali",
      distance: 12000,
      days: 7,
      desc: "Salah satu pulau terindah di Indonesia"),
  PlaceInfo(
      image: "assets/images/bromo.jpg",
      name: "Gunung Bromo",
      location: "Jawa Timur",
      distance: 8000,
      days: 3,
      desc: "Salah satu gunung terindah di Indonesia"),
];
