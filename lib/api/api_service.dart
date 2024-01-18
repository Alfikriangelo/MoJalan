import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mojalan/model/place_model.dart';

class ApiService {
  static Future<List<PlaceInfo>> fetchPlacesData() async {
    // Replace 'your_api_endpoint' with the actual endpoint to fetch places data
    final response = await http.get(Uri.parse(
        'https://mojalan-a9aad-default-rtdb.asia-southeast1.firebasedatabase.app/places.json'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<PlaceInfo> places =
          data.map((place) => PlaceInfo.fromJson(place)).toList();
      return places;
    } else {
      throw Exception('Failed to load places data');
    }
  }

  // You might have other methods for fetching tour guide data or other endpoints
}
