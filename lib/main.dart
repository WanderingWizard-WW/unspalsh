import 'package:flutter/material.dart';
import 'package:unspalsh/di/injector.dart' as injector;
import 'package:unspalsh/di/injector.dart';
import 'package:unspalsh/theme/app_theme.dart';
import 'package:unspalsh/view/home/home_page.dart';

Future<void> main() async {
  await injector.init(getIt);
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppTheme.lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: AppTheme.darkColorScheme),
      home: const HomePage(),
    );
  }
}
