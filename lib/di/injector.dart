import 'package:get_it/get_it.dart';
import 'package:unspalsh/di/bloc.dart' as bloc;
import 'package:unspalsh/di/network.dart' as network;
import 'package:unspalsh/di/repositories.dart' as repositories;
import 'package:unspalsh/di/services.dart' as services;

final getIt = GetIt.instance;

Future<void> init(GetIt getIt) async {
  await network.init(getIt);
  await services.init(getIt);
  await repositories.init(getIt);
  await bloc.init(getIt);
}
