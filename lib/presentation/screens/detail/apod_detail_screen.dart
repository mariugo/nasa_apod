import 'package:flutter/material.dart';

import 'package:nasa_apod/data/dto/apod_dto.dart';

class ApodDetailScreen extends StatelessWidget {
  final ApodDto apod;

  const ApodDetailScreen({
    Key? key,
    required this.apod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          apod.title,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(apod.url),
            Text(apod.date),
            Text(apod.explanation),
          ],
        ),
      ),
    );
  }
}
