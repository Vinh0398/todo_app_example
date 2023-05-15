import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter_app/data/dao/database/database_service.dart';
import 'package:to_do_flutter_app/data/dao/database/injector.dart';
import 'package:to_do_flutter_app/data/repository/injector.dart';
import 'package:to_do_flutter_app/domain/use_case/injector.dart';
import 'package:to_do_flutter_app/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().initDatabase();
  runApp(
    MultiProvider(
      providers: [
        ...databaseServiceProviders,
        ...todoRepositoryProviders,
        ...todoUseCaseProvider,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
