import 'package:equatable/equatable.dart';
import 'package:unspalsh/services/models/unsplash_photo_model.dart';

class UnsplashPhoto extends Equatable {
  const UnsplashPhoto({
    required this.id,
    required this.fullUrl,
    required this.regularUrl,
  });

  final String id;

  final String fullUrl;
  final String regularUrl;

  @override
  List<Object> get props => [id, fullUrl, regularUrl];

  factory UnsplashPhoto.fromModel(UnsplashPhotoModel model) {
    return UnsplashPhoto(
      id: model.id,
      fullUrl: model.urls.full,
      regularUrl: model.urls.regular,
    );
  }
}
