import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod/data/api/api_repository_imp.dart';
import 'package:nasa_apod/data/dto/apod_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  dotenv.testLoad(fileInput: File('.env').readAsStringSync());
  final ApiRepositoryImp apiRepositoryImp = ApiRepositoryImp();

  test('Should get apod by Date', () async {
    var result = await apiRepositoryImp.getApodByDate('2022-01-26');
    expect(result, isInstanceOf<ApodDto>());
  });

  test('Should get apod list', () async {
    var result = await apiRepositoryImp.getApods();
    expect(result, isInstanceOf<List<ApodDto>>());
  });

  test('Should get a 5 length apod list', () async {
    var result = await apiRepositoryImp.getApods();
    expect(result.length, 5);
  });
}
