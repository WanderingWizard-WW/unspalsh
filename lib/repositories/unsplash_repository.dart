import 'package:unspalsh/services/unsplash_api_service.dart';
import 'package:unspalsh/view/home/entities/unsplash_photo.dart';

class UnsplashRepository {
  UnsplashRepository(this._service);

  final UnsplashApiService _service;

  Future<List<UnsplashPhoto>> getImages(int count) async {
    return _service.getPhotos(count).then(
      (photos) {
        return photos.map((photo) => UnsplashPhoto.fromModel(photo)).toList();
      },
    );
  }

  Future<List<UnsplashPhoto>> searchImages(int count, String query) async {
    return _service.searchPhotos(count, query).then(
      (photos) {
        return photos.map((photo) => UnsplashPhoto.fromModel(photo)).toList();
      },
    );
  }
}
