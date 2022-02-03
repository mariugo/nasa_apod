import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nasa_apod/data/api/api_repository_imp.dart';

import 'package:nasa_apod/data/dto/apod_dto.dart';
import 'package:nasa_apod/data/local/data_store_repository_imp.dart';

class HomeContainerViewModel {
  final ApiRepositoryImp apiRepositoryImp = ApiRepositoryImp();
  final DataStoreRepositoryImp dataStoreRepositoryImp =
      DataStoreRepositoryImp();

  Future<List<ApodDto>> checkInternetAndReturnApods() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      var apods = await apiRepositoryImp.getApods();
      await dataStoreRepositoryImp.saveInDataStore(apods);
      return apods;
    } else {
      var dataStoreApodList = await dataStoreRepositoryImp.getFromDataStore();
      return dataStoreApodList;
    }
  }
}
