import 'package:get_it/get_it.dart';
import 'package:unspalsh/view/home/bloc/home_cubit.dart';

Future<void> init(GetIt getIt) async {
  getIt.registerFactory(() => HomeCubit(getIt()));

  await getIt.allReady();
}
