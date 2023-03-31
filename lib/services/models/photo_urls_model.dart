import 'package:json_annotation/json_annotation.dart';

part 'photo_urls_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoUrlsModel {
  PhotoUrlsModel({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  factory PhotoUrlsModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoUrlsModelFromJson(json);
  }
}
