import 'package:nasa_apod/domain/entity/apod.dart';

class ApodDto extends Apod {
  final String date;
  final String explanation;
  final String title;
  final String url;

  ApodDto({
    required this.date,
    required this.explanation,
    required this.title,
    required this.url,
  }) : super(
          data: date,
          explicacao: explanation,
          titulo: title,
          imagem: url,
        );

  factory ApodDto.fromJson(Map _json) => ApodDto(
        date: _json['date'],
        explanation: _json['explanation'],
        title: _json['title'],
        url: _json['url'],
      );
}
