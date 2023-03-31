import 'package:get_it/get_it.dart';
import 'package:unspalsh/repositories/unsplash_repository.dart';

Future<void> init(GetIt getIt) async {
  getIt.registerFactory<UnsplashRepository>(() => UnsplashRepository(getIt()));

  await getIt.allReady();
}
