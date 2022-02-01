import 'package:flutter/material.dart';

import 'package:nasa_apod/data/api/api_repository_imp.dart';
import 'package:nasa_apod/data/dto/apod_dto.dart';
import 'package:nasa_apod/presentation/screens/home/home_error.dart';
import 'package:nasa_apod/presentation/screens/home/home_loading.dart';
import 'package:nasa_apod/presentation/screens/home/home_screen.dart';

class HomeContainer extends StatelessWidget {
  final ApiRepositoryImp apiRepositoryImp;

  const HomeContainer({
    Key? key,
    required this.apiRepositoryImp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApodDto>>(
      future: apiRepositoryImp.getApods(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(apodList: snapshot.data!);
        }
        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        } else {
          return Container();
        }
      },
    );
  }
}
