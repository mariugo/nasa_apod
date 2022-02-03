import 'package:flutter/material.dart';

import '/presentation/containers/home_container_view_model.dart';
import '/data/dto/apod_dto.dart';
import '/presentation/screens/home/home_error.dart';
import '/presentation/screens/home/home_loading.dart';
import '/presentation/screens/home/home_screen.dart';

class HomeContainer extends StatelessWidget with HomeContainerViewModel {
  HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApodDto>>(
      future: checkInternetAndReturnApods(),
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
}
