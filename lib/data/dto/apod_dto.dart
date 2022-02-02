import 'package:nasa_apod/domain/entity/apod.dart';

class ApodDto extends Apod {
  final String date;
  final String explanation;
  final String mediaType;
  final String title;
  final String url;

  ApodDto({
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
  }) : super(
          data: date,
          explicacao: explanation,
          tipoMidia: mediaType,
          titulo: title,
          imagem: url,
        );

  factory ApodDto.fromJson(Map _json) => ApodDto(
        date: _json['date'],
        explanation: _json['explanation'],
        mediaType: _json['media_type'],
        title: _json['title'],
        url: _json['url'],
      );

  Map toJson() {
    return {
      'date': date,
      'explanation': explanation,
      'media_type': mediaType,
      'title': title,
      'url': url,
    };
  }
}
