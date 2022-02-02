import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '/data/api/api_repository_imp.dart';
import '/data/dto/apod_dto.dart';
import '/data/local/data_store_repository_imp.dart';
import '/presentation/screens/home/home_error.dart';
import '/presentation/screens/home/home_loading.dart';
import '/presentation/screens/home/home_screen.dart';

class HomeContainer extends StatefulWidget {
  final ApiRepositoryImp apiRepositoryImp;
  final DataStoreRepositoryImp dataStoreRepositoryImp;

  const HomeContainer({
    Key? key,
    required this.apiRepositoryImp,
    required this.dataStoreRepositoryImp,
  }) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApodDto>>(
      future: checkInternet(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(apods: snapshot.data!);
        }
        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        } else {
          return Container();
        }
      },
    );
  }

  Future<List<ApodDto>> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      var apods = await widget.apiRepositoryImp.getApods();
      await widget.dataStoreRepositoryImp.saveInDataStore(apods);
      return apods;
    } else {
      var dataStoreApodList =
          await widget.dataStoreRepositoryImp.getFromDataStore();
      return dataStoreApodList;
    }
  }
}
