import '/data/dto/apod_dto.dart';

abstract class DataStoreRepository {
  saveInDataStore(List<ApodDto> apods);
  Future<List<ApodDto>> getFromDataStore();
}
