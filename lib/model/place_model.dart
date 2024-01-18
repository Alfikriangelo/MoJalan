class PlaceInfo {
  final int days;
  final String desc;
  final int id;
  final String image;
  final String location;
  final String name;

  PlaceInfo({
    required this.days,
    required this.desc,
    required this.id,
    required this.image,
    required this.location,
    required this.name,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      days: json['days'],
      desc: json['desc'],
      id: json['id'],
      image: json['images'],
      location: json['location'],
      name: json['name'],
    );
  }
}
