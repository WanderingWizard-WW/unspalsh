import 'package:get_it/get_it.dart';
import 'package:unspalsh/services/unsplash_api_service.dart';

Future<void> init(GetIt getIt) async {
  getIt.registerFactory<UnsplashApiService>(() => UnsplashApiService(getIt()));

  await getIt.allReady();
}
