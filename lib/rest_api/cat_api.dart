import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cat_api/models/cat_model.dart';
import 'package:http/http.dart' as http;

class CatApi {
  get loadImages => _loadCatsList();
  var response;
  Future<List<Cat>> _loadCatsList() async {
    try {
      var response = await _getRawData(
        'https://api.thecatapi.com/v1/breeds/?limit=30',
        {'x-api-key': 'a3ea503f-7dec-4c12-83f7-98db97f5c22d'},
      );
      if (response.statusCode == 200) {
        return _decodeToCatsList(response);
      }
    } catch (e) {
      if (e is SocketException) {
        print("Socket exception: ${e.toString()}");
      }
      if (e is TimeoutException) {
        print("Timeout exception: ${e.toString()}");
      }
    }

    throw Exception('Error getting raw data from API');
  }

  Future<http.Response> _getRawData(
      String uri, Map<String, String> headers) async {
    return await http.get(Uri.parse(uri), headers: headers);
  }

  List<Cat> _decodeToCatsList(http.Response response) {
    List<dynamic> data = json.decode(response.body);

    if (data.length > 0) {
      return data.map((json) => Cat.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}






  
      // static const CACHED_IMAGES = 'CACHED_IMAGES';
    // final sharedPreference = await SharedPreferences.getInstance();
          //     sharedPreference.setStringList(
      //         CACHED_IMAGES,
      //         data
      //             .map(
      //               (e) => json.encode({'catImage': e['image'], 'id': e['id']}),
      //             )
      //             .toList());
    //else {
    //     return [];
    //   }
    // } on SocketException {
    //   final cachedData = sharedPreference.getStringList(CACHED_IMAGES);
    //   if (cachedData == null) {
    //     return [];
    //   }

    //   return Future.value(cachedData.map((e) {
    //     final decodedImage = json.decode(e);
    //     return Cat(
    //       id: decodedImage['id'],
    //       wikipediaUrl: decodedImage['wikipedia_url'],
    //       image: decodedImage['image'],
    //       name: decodedImage['name'],
    //       origin: decodedImage['origin'],
    //     );
    //   }).toList());