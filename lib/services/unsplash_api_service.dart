import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unspalsh/services/models/unsplash_photo_model.dart';

part 'unsplash_api_service.g.dart';

@RestApi()
abstract class UnsplashApiService {
  factory UnsplashApiService(Dio dio) = _UnsplashApiService;

  @GET("/photos/random")
  Future<List<UnsplashPhotoModel>> getPhotos(@Query('count') int count);

  @GET("/photos/random")
  Future<List<UnsplashPhotoModel>> searchPhotos(
    @Query('count') int count,
    @Query('query') String query,
  );
}
