import 'dart:convert';

import '/data/api/api_repository.dart';
import '/data/dto/apod_dto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.get('API_KEY');

const String baseUrl = 'https://api.nasa.gov/planetary/apod?api_key=';

class ApiRepositoryImp extends ApiRepository {
  @override
  Future<List<ApodDto>> getApods() async {
    final _url = Uri.parse('$baseUrl$apiKey&count=5');
    final _response = await http.get(_url);

    if (_response.statusCode == 200) {
      final _json = jsonDecode(_response.body) as List;
      List<ApodDto> _apodList =
          _json.map((_apod) => ApodDto.fromJson(_apod)).toList();
      return _apodList;
    }
    throw Exception('Error ${_response.statusCode}');
  }

  @override
  Future<ApodDto> getApodByDate(String date) async {
    final _url = Uri.parse('$baseUrl$apiKey&date=$date');
    final _response = await http.get(_url);
    if (_response.statusCode == 200) {
      final _json = jsonDecode(_response.body);
      return ApodDto(
        date: _json['date'],
        explanation: _json['explanation'],
        mediaType: _json['media_type'],
        title: _json['title'],
        url: _json['url'],
      );
    }
    throw Exception('Error ${_response.statusCode}');
  }
}
