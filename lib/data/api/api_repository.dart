import '/data/dto/apod_dto.dart';

abstract class ApiRepository {
  Future<List<ApodDto>> getApods();
  Future<ApodDto> getApodByDate(String date);
}
