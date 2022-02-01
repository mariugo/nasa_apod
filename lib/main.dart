import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        apiRepositoryImp: ApiRepositoryImp(),
      ),
    );
  }
}
