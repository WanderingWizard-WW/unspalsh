import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unspalsh/config/network_config.dart';

Future<void> init(GetIt getIt) async {
  getIt.registerSingletonAsync<Dio>(() async {
    final baseOptions = BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      contentType: 'application/json',
      headers: {
        'Accept-Version': NetworkConfig.apiVersion,
        'Authorization': " Client-ID ${NetworkConfig.apiAccessKey}",
      },
    );

    final dio = Dio(baseOptions);

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  });

  await getIt.allReady();
}
