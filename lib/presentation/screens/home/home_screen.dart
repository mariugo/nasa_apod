import 'package:flutter/material.dart';

import 'package:nasa_apod/data/dto/apod_dto.dart';

class HomeScreen extends StatefulWidget {
  final List<ApodDto> apodList;

  const HomeScreen({
    Key? key,
    required this.apodList,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NASA Apod',
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.apodList.length,
          itemBuilder: (_, index) => Text(
            widget.apodList[index].title,
          ),
        ),
      ),
    );
  }
}
