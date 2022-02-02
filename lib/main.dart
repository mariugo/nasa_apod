import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa_apod/data/local/data_store_repository_imp.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'NASA Apod',
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeContainer(
        apiRepositoryImp: ApiRepositoryImp(),
        dataStoreRepositoryImp: DataStoreRepositoryImp(),
      ),
    );
  }
}
