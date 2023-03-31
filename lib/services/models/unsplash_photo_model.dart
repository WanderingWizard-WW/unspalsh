import 'package:json_annotation/json_annotation.dart';
import 'package:unspalsh/services/models/photo_urls_model.dart';

part 'unsplash_photo_model.g.dart';

@JsonSerializable(createToJson: false)
class UnsplashPhotoModel {
  UnsplashPhotoModel({
    required this.id,
    required this.urls,
  });

  final String id;
  final PhotoUrlsModel urls;

  factory UnsplashPhotoModel.fromJson(Map<String, dynamic> json) {
    return _$UnsplashPhotoModelFromJson(json);
  }
}
