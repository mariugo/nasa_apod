import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_apod/data/local/data_store_repository_imp.dart';
import 'package:nasa_apod/presentation/theme/apod_theme.dart';

import '/data/api/api_repository_imp.dart';
import '/presentation/containers/home_container.dart';

Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA Apod',
      theme: ApodTheme.light(),
      darkTheme: ApodTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeContainer(
        apiRepositoryImp: ApiRepositoryImp(),
        dataStoreRepositoryImp: DataStoreRepositoryImp(),
      ),
    );
  }
}
