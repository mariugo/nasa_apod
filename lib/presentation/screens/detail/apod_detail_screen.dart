import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/data/dto/apod_dto.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            apod.mediaType == 'image'
                ? CachedNetworkImage(
                    imageUrl: apod.url,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        'Video',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
            Text(
              apod.date,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    apod.explanation,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
