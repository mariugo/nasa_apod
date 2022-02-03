import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ApodCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String mediaType;
  final String date;
  final VoidCallback navigate;

  const ApodCardWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.mediaType,
    required this.date,
    required this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigate,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: mediaType == 'image'
                      ? CachedNetworkImage(
                          imageUrl: image,
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                          child: Center(
                            child: Text(
                              'Video',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                date,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
