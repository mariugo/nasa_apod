import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/dto/apod_dto.dart';
import '/data/local/data_store_repository.dart';

class DataStoreRepositoryImp extends DataStoreRepository {
  @override
  saveInDataStore(List<ApodDto> apods) async {
    var _dataStore = await SharedPreferences.getInstance();
    String _apodJson = json.encode(apods);
    _dataStore.setString('apods_data_store', _apodJson);
  }

  @override
  Future<List<ApodDto>> getFromDataStore() async {
    var _dataStore = await SharedPreferences.getInstance();
    var _apodJsonString = _dataStore.getString('apods_data_store');
    var _json = json.decode(_apodJsonString!) as List;
    List<ApodDto> _apodList =
        _json.map((_apod) => ApodDto.fromJson(_apod)).toList();
    return _apodList;
  }
}
